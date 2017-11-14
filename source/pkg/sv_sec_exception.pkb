CREATE OR REPLACE PACKAGE BODY sv_sec_exception
AS


--------------------------------------------------------------------------------
-- P R O C E D U R E :   S E N D _ N O T I F I C A T I O N
--------------------------------------------------------------------------------
-- Sends Notifications when exceptions are created, approved and/or rejected
--------------------------------------------------------------------------------
PROCEDURE send_notification
  (
  p_type                     IN VARCHAR2,
  p_application_id           IN NUMBER,
  p_attribute_id             IN NUMBER,
  p_page_id                  IN NUMBER,
  p_number_affected          IN NUMBER,
  p_app_user                 IN VARCHAR2,
  p_attribute_set_id         IN NUMBER,
  p_user_workspace_id        IN NUMBER,
  p_justification            IN VARCHAR2
  )
IS
BEGIN

-- Future Feature
NULL;

END send_notification;



--------------------------------------------------------------------------------
-- FUNCTION: G E T _ E X C E P T I O N _ I D
--------------------------------------------------------------------------------
-- Gets the surrogate PK for an Exception
--------------------------------------------------------------------------------
FUNCTION get_exception_id
  (
  p_exception_pk             IN VARCHAR2,
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER  
  )
RETURN NUMBER
IS
  l_exception_id             NUMBER;
  l_pk                       apex_application_global.vc_arr2;    
  l_attribute_id             NUMBER;
  l_page_id                  NUMBER;
  l_component_id             VARCHAR2(1000);
  l_column_id                NUMBER;
BEGIN

-- Parse through the p_exception_pk and decompose into individual items
l_pk := apex_util.string_to_table(p_exception_pk,'|');

-- Loop through the table and assign each component
FOR x IN 1..l_pk.COUNT
LOOP
  CASE 
    WHEN x = 1 THEN NULL;
    WHEN x = 2 THEN l_attribute_id := l_pk(x);    
    WHEN x = 3 THEN l_page_id      := l_pk(x);
    WHEN x = 4 THEN l_component_id := l_pk(x);
    WHEN x = 5 THEN l_column_id    := l_pk(x);
  END CASE;
END LOOP;

SELECT
  exception_id
INTO
  l_exception_id
FROM
  sv_sec_exceptions
WHERE
  attribute_id = l_attribute_id
  AND application_id = p_application_id
  AND attribute_set_id = p_attribute_set_id
  AND
  CASE 
    WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND l_column_id IS NULL AND page_id = l_page_id THEN 1
    WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NULL AND page_id = l_page_id AND component_id = l_component_id THEN 1
    WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NOT NULL AND page_id = l_page_id AND component_id = l_component_id AND column_id = l_column_id THEN 1
    ELSE 0
  END = 1;

RETURN l_exception_id;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_exception_id;


--------------------------------------------------------------------------------
-- PROCEDURE: S A V E _ E X C E P T I O N
--------------------------------------------------------------------------------
-- Saves an exception
--------------------------------------------------------------------------------
PROCEDURE save_exception
  (
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_exception_pk             IN VARCHAR2,
  p_justification            IN VARCHAR2,
  p_sert_app_id              IN NUMBER   DEFAULT nv('APP_ID'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_user_workspace_id        IN NUMBER   DEFAULT nv('G_WORKSPACE_ID')
  )
IS
  l_scope                    VARCHAR2(100);
  l_attribute_id             NUMBER;
  l_page_id                  NUMBER;
  l_component_id             VARCHAR2(1000);
  l_column_id                NUMBER;
  l_count                    NUMBER := 0;
  l_pk                       apex_application_global.vc_arr2;
  l_checksum                 RAW(16);
  l_val                      CLOB;
  l_exception_id             NUMBER;
  l_attribute_name           VARCHAR2(255);
  l_exception_api            VARCHAR2(255) := 'N';
BEGIN

-- Determine if the exception needs to be created in an external system
FOR x IN (SELECT * FROM sv_sec_snippets WHERE snippet_key = 'EXCEPTION_API')
LOOP
  IF UPPER(x.snippet) = 'Y' OR UPPER(x.snippet) = 'YES' THEN
    l_exception_api := 'Y';
  END IF;
END LOOP;

-- Parse through the p_exception_pk and decompose into individual items
l_pk := apex_util.string_to_table(p_exception_pk, '|');

-- Loop through the table and assign each component
-- String should conform to this: SCOPE:ATTRIBUTE_ID:PAGE_ID:COMPONENT_ID:COLUMN_ID
FOR x IN 1..l_pk.COUNT
LOOP
  CASE 
    WHEN x = 1 THEN l_scope        := l_pk(x);
    WHEN x = 2 THEN l_attribute_id := l_pk(x);    
    WHEN x = 3 THEN l_page_id      := l_pk(x);
    WHEN x = 4 THEN l_component_id := l_pk(x);
    WHEN x = 5 THEN l_column_id    := l_pk(x);
  END CASE;
END LOOP;

IF l_scope = 'BAT' THEN
  -- Loop though the collection for all FAIL components that match
  FOR x IN 
    (
    SELECT 
      * 
    FROM 
      sv_sec_collection_data 
    WHERE 
      collection_id = SYS_CONTEXT('SV_SERT_CTX', 'COLLECTION_ID') 
      AND CASE 
        WHEN l_attribute_id IS NOT NULL AND l_page_id IS     NULL AND l_component_id IS     NULL AND l_column_id IS     NULL AND attribute_id = l_attribute_id THEN 1
        WHEN l_attribute_id IS NOT NULL AND l_page_id IS NOT NULL AND l_component_id IS     NULL AND l_column_id IS     NULL AND attribute_id = l_attribute_id AND page_id = l_page_id THEN 1
        WHEN l_attribute_id IS NOT NULL AND l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS     NULL AND attribute_id = l_attribute_id AND page_id = l_page_id AND component_id = l_component_id THEN 1
        WHEN l_attribute_id IS NOT NULL AND l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NOT NULL AND attribute_id = l_attribute_id AND page_id = l_page_id AND component_id = l_component_id AND column_id = l_column_id THEN 1
        ELSE 0 END = 1
      AND result = 'FAIL'
    )
  LOOP

    -- Insert the Exception
    INSERT INTO sv_sec_exceptions 
      (
      attribute_set_id,
      application_id,
      attribute_id,
      page_id,
      component_id,
      column_id,
      justification,
      checksum,
      val
      )
    VALUES
      (
      p_attribute_set_id,
      p_application_id,
      x.attribute_id,
      x.page_id,
      x.component_id,
      x.column_id,
      p_justification,
      x.checksum,
      x.val
      );

    -- Increment the counter
    l_count := l_count + 1;
    
  END LOOP;

  -- Update the Collection
  UPDATE  
    sv_sec_collection_data 
  SET
    result = 'PENDING' 
  WHERE 
      collection_id = SYS_CONTEXT('SV_SERT_CTX', 'COLLECTION_ID') 
      AND CASE 
        WHEN l_attribute_id IS NOT NULL AND l_page_id IS     NULL AND l_component_id IS     NULL AND l_column_id IS     NULL AND attribute_id = l_attribute_id THEN 1
        WHEN l_attribute_id IS NOT NULL AND l_page_id IS NOT NULL AND l_component_id IS     NULL AND l_column_id IS     NULL AND attribute_id = l_attribute_id AND page_id = l_page_id THEN 1
        WHEN l_attribute_id IS NOT NULL AND l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS     NULL AND attribute_id = l_attribute_id AND page_id = l_page_id AND component_id = l_component_id THEN 1
        WHEN l_attribute_id IS NOT NULL AND l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NOT NULL AND attribute_id = l_attribute_id AND page_id = l_page_id AND component_id = l_component_id AND column_id = l_column_id THEN 1
        ELSE 0 END = 1
      AND result = 'FAIL';

  -- Send Notifications
  send_notification
    (
    p_type              => 'CREATE',
    p_application_id    => p_application_id,
    p_attribute_id      => l_attribute_id,
    p_page_id           => l_page_id,
    p_number_affected   => l_count,
    p_app_user          => p_app_user,
    p_attribute_set_id  => p_attribute_set_id,
    p_user_workspace_id => p_user_workspace_id,
    p_justification     => p_justification
    );

  -- Log the event
  sv_sec_log_events.log_exception_event
   (p_event_key         => 'SUBMITTED',
    p_application_id    => p_application_id,
    p_attribute_id      => l_attribute_id,
    p_page_id           => l_page_id,
    p_component_id      => l_component_id,
    p_column_id         => l_column_id, 
    p_number_affected   => l_count,
    p_sert_app_id       => p_sert_app_id,
    p_app_user          => p_app_user,
    p_app_session       => p_app_session,
    p_attribute_set_id  => p_attribute_set_id,
    p_user_workspace_id => p_user_workspace_id,
    p_justification     => p_justification
  );
  
  -- Apply the exceptions
  apply_exceptions
    (
    p_collection_id    => SYS_CONTEXT('SV_SERT_CTX', 'COLLECTION_ID'),
    p_application_id   => p_application_id,
    p_attribute_set_id => p_attribute_set_id,
    p_app_user         => p_app_user,
    p_attribute_id     => l_attribute_id
    );


ELSIF l_scope = 'IND' THEN
  -- Process for an individual exception

  -- Determine if the exception should be INSERTED or UPDATED
  SELECT 
    COUNT(*)
  INTO 
    l_count 
  FROM 
    sv_sec_exceptions
  WHERE 
    application_id = v('P200_APPLICATION_ID')
    AND attribute_set_id = v('P0_ATTRIBUTE_SET_ID')
    AND attribute_id = l_attribute_id
    AND
      CASE 
        WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND l_column_id IS NULL AND page_id = l_page_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NULL AND page_id = l_page_id AND component_id = l_component_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NOT NULL AND page_id = l_page_id AND component_id = l_component_id AND column_id = l_column_id THEN 1
        ELSE 0
     END = 1;

  IF l_count = 0 THEN

    -- Get the checksum from the collection
    SELECT 
      checksum,
      val
    INTO 
      l_checksum,
      l_val
    FROM 
      sv_sec_collection_data
    WHERE 
      application_id = v('P200_APPLICATION_ID')
      --AND attribute_set_id = v('P0_ATTRIBUTE_SET_ID')
      AND attribute_id = l_attribute_id
      AND collection_id  = SYS_CONTEXT('SV_SERT_CTX', 'COLLECTION_ID')
      AND
        CASE 
          WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND l_column_id IS NULL AND page_id = l_page_id THEN 1
          WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NULL AND page_id = l_page_id AND component_id = l_component_id THEN 1
          WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NOT NULL AND page_id = l_page_id AND component_id = l_component_id AND column_id = l_column_id THEN 1
          ELSE 0
       END = 1;

    -- Insert the Exception
    INSERT INTO sv_sec_exceptions 
      (
      attribute_set_id,
      application_id,
      attribute_id,
      page_id,
      component_id,
      column_id,
      justification,
      checksum,
      val
      )
    VALUES
      (
      p_attribute_set_id,
      p_application_id,
      l_attribute_id,
      l_page_id,
      l_component_id,
      l_column_id,
      p_justification,
      l_checksum,
      l_val
      )
    RETURNING exception_id INTO l_exception_id;

    -- Update the Collection
    UPDATE sv_sec_collection_data SET
      result = 'PENDING'
    WHERE
      collection_id = SYS_CONTEXT('SV_SERT_CTX', 'COLLECTION_ID')
      AND application_id = p_application_id
      AND attribute_id = l_attribute_id
      AND
        CASE 
          WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND l_column_id IS NULL AND page_id = l_page_id THEN 1
          WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NULL AND page_id = l_page_id AND component_id = l_component_id THEN 1
          WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NOT NULL AND page_id = l_page_id AND component_id = l_component_id AND column_id = l_column_id THEN 1
          ELSE 0
        END = 1;

    -- Apply the exceptions
    apply_exceptions
      (
      p_collection_id    => SYS_CONTEXT('SV_SERT_CTX', 'COLLECTION_ID'),
      p_application_id   => p_application_id,
      p_attribute_set_id => p_attribute_set_id,
      p_app_user         => p_app_user,
      p_attribute_id     => l_attribute_id
      );

    -- Create the exception in the External API
    IF l_exception_api = 'Y' THEN
      SELECT attribute_name INTO l_attribute_name FROM sv_sec_attributes WHERE attribute_id = l_attribute_id;
 
      FOR x IN (SELECT * FROM sv_sec_collection_data WHERE exception_id = l_exception_id)
      LOOP
 
        -- Call the API to log the exception to an external system
        sv_sec_log_exception_api
          (
          p_app_user                 => v('APP_USER'),
          p_justification            => p_justification,
          p_application_id           => p_application_id,
          p_page_id                  => l_page_id,
          p_attribute_name           => l_attribute_name,
          p_component_name           => x.component_name,
          p_column_name              => x.column_name,
          p_exception_id             => l_exception_id
          );

      END LOOP;
    END IF;

  ELSE

    -- Update the Exception
    UPDATE sv_sec_exceptions SET justification = p_justification WHERE
      application_id = v('P200_APPLICATION_ID')
      AND attribute_set_id = v('P0_ATTRIBUTE_SET_ID')
      AND attribute_id = l_attribute_id
      AND
        CASE 
          WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND l_column_id IS NULL AND page_id = l_page_id THEN 1
          WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NULL AND page_id = l_page_id AND component_id = l_component_id THEN 1
          WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NOT NULL AND page_id = l_page_id AND component_id = l_component_id AND column_id = l_column_id THEN 1
          ELSE 0
        END = 1;

  END IF;

  -- Send Notifications


  -- Log the event
  SV_SEC_LOG_EVENTS.LOG_EXCEPTION_EVENT 
   (p_event_key        => 'SUBMITTED',
    p_application_id   => p_application_id,
    p_attribute_id     => l_attribute_id,
    p_page_id          => l_page_id,
    p_component_id     => l_component_id,
    p_column_id        => l_column_id, 
    p_number_affected  => 1,
    p_sert_app_id      => p_sert_app_id,
    p_app_user         => p_app_user,
    p_app_session      => p_app_session,
    p_attribute_set_id => p_attribute_set_id,
    p_justification    => p_justification
  );

END IF;

EXCEPTION
WHEN OTHERS THEN
  sv_sec_error.raise_unanticipated;

END save_exception;


--------------------------------------------------------------------------------
-- PROCEDURE: S A V E _ A P P R O V A L
--------------------------------------------------------------------------------
-- Saves an approval
--------------------------------------------------------------------------------
PROCEDURE save_approval
  (
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_exception_pk             IN VARCHAR2,
  p_val                      IN CLOB     DEFAULT NULL,
  p_checksum                 IN VARCHAR2 DEFAULT NULL,
  p_sert_app_id              IN NUMBER   DEFAULT nv('APP_ID'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_user_workspace_id        IN NUMBER   DEFAULT nv('G_WORKSPACE_ID')
  )
IS
  l_scope                    VARCHAR2(100);
  l_attribute_id             NUMBER;
  l_page_id                  NUMBER;
  l_component_id             VARCHAR2(1000);
  l_column_id                NUMBER;
  l_count                    NUMBER := 0;
  l_pk                       apex_application_global.vc_arr2;    
  l_exception_id             sv_sec_exceptions.exception_id%TYPE;
  l_justification            sv_sec_exceptions.justification%TYPE;
BEGIN

-- Parse through the p_exception_pk and decompose into individual items
l_pk := apex_util.string_to_table(p_exception_pk, '|');

-- Loop through the table and assign each component
-- String should conform to this: ATTRIBUTE_ID:PAGE_ID:COMPONENT_ID:COLUMN_ID
FOR x IN 1..l_pk.COUNT
LOOP
  CASE 
    WHEN x = 1 THEN l_scope        := l_pk(x);
    WHEN x = 2 THEN l_attribute_id := l_pk(x);    
    WHEN x = 3 THEN l_page_id      := l_pk(x);
    WHEN x = 4 THEN l_component_id := l_pk(x);
    WHEN x = 5 THEN l_column_id    := l_pk(x);
  END CASE;
END LOOP;

-- Get the Exception ID - any of them if it is batch
FOR x IN 
  (
  SELECT 
    * 
  FROM 
    sv_sec_exceptions
  WHERE application_id = p_application_id
    AND attribute_set_id = p_attribute_set_id
    AND attribute_id = l_attribute_id
    AND created_by != p_app_user
    AND approved_flag = 'P'
  )
LOOP
  l_exception_id := x.exception_id;
  l_justification := x.justification;
END LOOP;

IF l_scope = 'BAT' THEN

  -- Count the number to be processed
  SELECT
    count(*)
  INTO
    l_count
  FROM
    sv_sec_exceptions
  WHERE
      application_id = p_application_id
      AND attribute_set_id = p_attribute_set_id
      AND attribute_id = l_attribute_id
      AND created_by != p_app_user
      AND approved_flag = 'P';

  -- Update all records that are pending and not created by the current user
  UPDATE 
    sv_sec_exceptions
  SET 
    rejected_justification = justification, 
    approved_flag = 'Y', 
    approved_on = SYSDATE, 
    approved_by = p_app_user,
    approved_ws = p_user_workspace_id
  WHERE
      application_id = p_application_id
      AND attribute_set_id = p_attribute_set_id
      AND attribute_id = l_attribute_id
      AND created_by != p_app_user
      AND approved_flag = 'P';

  -- Log the event
  IF l_count > 0 THEN
    SV_SEC_LOG_EVENTS.LOG_EXCEPTION_EVENT 
     (p_event_key         => 'APPROVED',
      p_application_id    => p_application_id,
      p_attribute_id      => l_attribute_id,
      p_page_id           => l_page_id,
      p_component_id      => l_component_id,
      p_column_id         => l_column_id, 
      p_number_affected   => l_count,
      p_sert_app_id       => p_sert_app_id,
      p_app_user          => p_app_user,
      p_app_session       => p_app_session,
      p_attribute_set_id  => p_attribute_set_id,
      p_user_workspace_id => p_user_workspace_id,
      p_justification     => l_justification,
      p_exception_id      => l_exception_id
      );
  END IF;

ELSIF l_scope = 'IND' THEN
  -- Process for an individual exception

  -- Update the Collection
  UPDATE sv_sec_collection_data SET
    result = 'APPROVED'
  WHERE
    collection_id = SYS_CONTEXT('SV_SERT_CTX', 'COLLECTION_ID')
    AND application_id = p_application_id
    AND attribute_id = l_attribute_id
    AND
      CASE 
        WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND l_column_id IS NULL AND page_id = l_page_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NULL AND page_id = l_page_id AND component_id = l_component_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NOT NULL AND page_id = l_page_id AND component_id = l_component_id AND column_id = l_column_id THEN 1
        ELSE 0
      END = 1;

  -- Update the Exception
  IF p_val IS NULL THEN

  UPDATE 
    sv_sec_exceptions 
  SET 
    approved_flag = 'Y', 
    approved_by = v('APP_USER'), 
    approved_on = SYSDATE,
    approved_ws = p_user_workspace_id
  WHERE application_id = v('P200_APPLICATION_ID')
    AND attribute_set_id = v('P0_ATTRIBUTE_SET_ID')
    AND attribute_id = l_attribute_id
    AND
      CASE 
        WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND l_column_id IS NULL AND page_id = l_page_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NULL AND page_id = l_page_id AND component_id = l_component_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NOT NULL AND page_id = l_page_id AND component_id = l_component_id AND column_id = l_column_id THEN 1
        ELSE 0
      END = 1;
 
  ELSE
  
  UPDATE 
    sv_sec_exceptions 
  SET 
    approved_flag = 'Y', 
    approved_by = v('APP_USER'), 
    approved_on = SYSDATE,
    val = p_val,
    checksum = p_checksum
  WHERE application_id = v('P200_APPLICATION_ID')
    AND attribute_set_id = v('P0_ATTRIBUTE_SET_ID')
    AND attribute_id = l_attribute_id
    AND
      CASE 
        WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND l_column_id IS NULL AND page_id = l_page_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NULL AND page_id = l_page_id AND component_id = l_component_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NOT NULL AND page_id = l_page_id AND component_id = l_component_id AND column_id = l_column_id THEN 1
        ELSE 0
      END = 1;
  
  END IF;
  
  -- Log the event
  SV_SEC_LOG_EVENTS.LOG_EXCEPTION_EVENT 
   (p_event_key         => 'APPROVED',
    p_application_id    => p_application_id,
    p_attribute_id      => l_attribute_id,
    p_page_id           => l_page_id,
    p_component_id      => l_component_id,
    p_column_id         => l_column_id, 
    p_number_affected   => 1,
    p_sert_app_id       => p_sert_app_id,
    p_app_user          => p_app_user,
    p_app_session       => p_app_session,
    p_attribute_set_id  => p_attribute_set_id,
    p_user_workspace_id => p_user_workspace_id,
    p_justification     => l_justification,
    p_exception_id      => l_exception_id
  );

END IF;

-- Apply the exceptions
apply_exceptions
  (
  p_collection_id    => SYS_CONTEXT('SV_SERT_CTX', 'COLLECTION_ID'),
  p_application_id   => p_application_id,
  p_attribute_set_id => p_attribute_set_id,
  p_app_user         => p_app_user,
  p_attribute_id     => l_attribute_id
  );

EXCEPTION
WHEN OTHERS THEN
  sv_sec_error.raise_unanticipated;

END save_approval;


--------------------------------------------------------------------------------
-- PROCEDURE: S A V E _ R E J E C T I O N
--------------------------------------------------------------------------------
-- Saves a rejection
--------------------------------------------------------------------------------
PROCEDURE save_rejection
  (
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_exception_pk             IN VARCHAR2,
  p_rejection                IN VARCHAR2,
  p_val                      IN CLOB     DEFAULT NULL,
  p_checksum                 IN VARCHAR2 DEFAULT NULL,
  p_sert_app_id              IN NUMBER   DEFAULT nv('APP_ID'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_user_workspace_id        IN NUMBER   DEFAULT nv('G_WORKSPACE_ID')
  )
IS
  l_scope                    VARCHAR2(10);
  l_attribute_id             NUMBER;
  l_page_id                  NUMBER;
  l_component_id             VARCHAR2(1000);
  l_column_id                NUMBER;
  l_count                    NUMBER := 0;
  l_pk                       apex_application_global.vc_arr2;    
  l_exception_id             NUMBER;
BEGIN

-- Parse through the p_exception_pk and decompose into individual items
l_pk := apex_util.string_to_table(p_exception_pk, '|');

-- Loop through the table and assign each component
-- String should conform to this: ATTRIBUTE_ID:PAGE_ID:COMPONENT_ID:COLUMN_ID
FOR x IN 1..l_pk.COUNT
LOOP
  CASE 
    WHEN x = 1 THEN l_scope        := l_pk(x);
    WHEN x = 2 THEN l_attribute_id := l_pk(x);    
    WHEN x = 3 THEN l_page_id      := l_pk(x);
    WHEN x = 4 THEN l_component_id := l_pk(x);
    WHEN x = 5 THEN l_column_id    := l_pk(x);
  END CASE;
END LOOP;

-- Get the Exception ID - any of them if it is batch
FOR x IN 
  (
  SELECT 
    * 
  FROM 
    sv_sec_exceptions
  WHERE application_id = p_application_id
    AND attribute_set_id = p_attribute_set_id
    AND attribute_id = l_attribute_id
    AND created_by != p_app_user
    AND approved_flag = 'P'
  )
LOOP
  l_exception_id := x.exception_id;
END LOOP;

IF l_scope = 'BAT' THEN

  -- Count the number to be processed
  SELECT
    count(*)
  INTO
    l_count
  FROM
    sv_sec_exceptions
  WHERE
      application_id = p_application_id
      AND attribute_set_id = p_attribute_set_id
      AND attribute_id = l_attribute_id
      AND created_by != p_app_user
      AND approved_flag = 'P';

  -- Update all records that are pending and not created by the current user
  UPDATE 
    sv_sec_exceptions
  SET 
    rejected_justification = justification, 
    approved_flag = 'R', 
    rejection = p_rejection, 
    rejected_on = SYSDATE, 
    rejected_by = p_app_user,
    rejected_ws = p_user_workspace_id
  WHERE
      application_id = p_application_id
      AND attribute_set_id = p_attribute_set_id
      AND attribute_id = l_attribute_id
      AND created_by != p_app_user
      AND approved_flag = 'P';

  -- Log the event
  IF l_count > 0 THEN
    SV_SEC_LOG_EVENTS.LOG_EXCEPTION_EVENT 
     (p_event_key         => 'REJECTED',
      p_application_id    => p_application_id,
      p_attribute_id      => l_attribute_id,
      p_page_id           => l_page_id,
      p_component_id      => l_component_id,
      p_column_id         => l_column_id, 
      p_number_affected   => l_count,
      p_sert_app_id       => p_sert_app_id,
      p_app_user          => p_app_user,
      p_app_session       => p_app_session,
      p_attribute_set_id  => p_attribute_set_id,
      p_user_workspace_id => p_user_workspace_id,
      p_justification     => p_rejection,
      p_exception_id      => l_exception_id
      );
  END IF;

ELSIF l_scope = 'IND' THEN

  -- Update the Collection
  UPDATE sv_sec_collection_data SET
    result = 'REJECTED'
  WHERE
    collection_id = SYS_CONTEXT('SV_SERT_CTX', 'COLLECTION_ID')
    AND attribute_id = l_attribute_id
    AND application_id = p_application_id
    AND
      CASE 
        WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND l_column_id IS NULL AND page_id = l_page_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NULL AND page_id = l_page_id AND component_id = l_component_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NOT NULL AND page_id = l_page_id AND component_id = l_component_id AND column_id = l_column_id THEN 1
        ELSE 0
      END = 1;

  -- Update the Exception
  IF p_val IS NULL THEN

  UPDATE 
    sv_sec_exceptions 
  SET 
    rejected_justification = justification, 
    approved_flag = 'R', 
    rejection = p_rejection, 
    rejected_on = SYSDATE, 
    rejected_by = v('APP_USER'),
    rejected_ws = p_user_workspace_id
  WHERE application_id = v('P200_APPLICATION_ID')
    AND attribute_set_id = v('P0_ATTRIBUTE_SET_ID')
    AND attribute_id = l_attribute_id
    AND
      CASE 
        WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND l_column_id IS NULL AND page_id = l_page_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NULL AND page_id = l_page_id AND component_id = l_component_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NOT NULL AND page_id = l_page_id AND component_id = l_component_id AND column_id = l_column_id THEN 1
        ELSE 0
      END = 1;
  
  ELSE
  
  UPDATE 
    sv_sec_exceptions 
  SET 
    rejected_justification = justification, 
    approved_flag = 'R', 
    rejection = p_rejection, 
    rejected_on = SYSDATE, 
    rejected_by = v('APP_USER'),
    rejected_ws = p_user_workspace_id,
    val = p_val, 
    checksum = p_checksum
  WHERE application_id = v('P200_APPLICATION_ID')
    AND attribute_set_id = v('P0_ATTRIBUTE_SET_ID')
    AND attribute_id = l_attribute_id
    AND
      CASE 
        WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND l_column_id IS NULL AND page_id = l_page_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NULL AND page_id = l_page_id AND component_id = l_component_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NOT NULL AND page_id = l_page_id AND component_id = l_component_id AND column_id = l_column_id THEN 1
        ELSE 0
      END = 1;  
  END IF;

  -- Log the event
  SV_SEC_LOG_EVENTS.LOG_EXCEPTION_EVENT 
    (
    p_event_key         => 'REJECTED',
    p_application_id    => p_application_id,
    p_attribute_id      => l_attribute_id,
    p_page_id           => l_page_id,
    p_component_id      => l_component_id,
    p_column_id         => l_column_id, 
    p_number_affected   => 1,
    p_sert_app_id       => p_sert_app_id,
    p_app_user          => p_app_user,
    p_app_session       => p_app_session,
    p_attribute_set_id  => p_attribute_set_id,
    p_user_workspace_id => p_user_workspace_id,
    p_justification     => p_rejection,
    p_exception_id      => l_exception_id
    );

END IF;

-- Apply the exceptions
apply_exceptions
  (
  p_collection_id    => SYS_CONTEXT('SV_SERT_CTX', 'COLLECTION_ID'),
  p_application_id   => p_application_id,
  p_attribute_set_id => p_attribute_set_id,
  p_app_user         => p_app_user,
  p_attribute_id     => l_attribute_id
  );

EXCEPTION
WHEN OTHERS THEN
  sv_sec_error.raise_unanticipated;
  
END save_rejection;

--------------------------------------------------------------------------------
-- PROCEDURE: S A V E _ N O T A T I O N 
--------------------------------------------------------------------------------
-- Saves a Notation
--------------------------------------------------------------------------------
PROCEDURE save_notation
  (
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_notation_pk              IN VARCHAR2,
  p_notation_msg             IN VARCHAR2,
  p_workspace_id             IN VARCHAR2,
  p_sert_app_id              IN NUMBER   DEFAULT nv('APP_ID'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_user_workspace_id        IN NUMBER   DEFAULT nv('G_WORKSPACE_ID')
  )
IS
  l_attribute_id             NUMBER;
  l_page_id                  NUMBER;
  l_component_id             VARCHAR2(1000);
  l_column_id                NUMBER;
  l_count                    NUMBER;
  l_pk                       apex_application_global.vc_arr2;  
  l_generic_event_type_id    NUMBER;
  l_dummy                    VARCHAR2(1000);
  l_owner                    VARCHAR2(255);
BEGIN

-- Get the SERT Owner
SELECT owner INTO l_owner FROM apex_applications WHERE application_id = p_sert_app_id;

-- Parse through the p_notation_pk and decompose into individual items
l_pk := apex_util.string_to_table(p_notation_pk, '|');

-- Loop through the table and assign each component
-- String should conform to this: ATTRIBUTE_ID:PAGE_ID:COMPONENT_ID:COLUMN_ID
FOR x IN 1..l_pk.COUNT
LOOP
  CASE 
    WHEN x = 1 THEN l_attribute_id := l_pk(x);    
    WHEN x = 2 THEN l_page_id      := l_pk(x);
    WHEN x = 3 THEN l_component_id := l_pk(x);
    WHEN x = 4 THEN l_column_id    := l_pk(x);
  END CASE;
END LOOP;

-- Log the Event
sv_sec_log_events.log_exception_event(
    p_event_key         => 'NOTATION',
    p_application_id    => p_application_id,
    p_attribute_id      => l_attribute_id,
    p_page_id           => l_page_id,
    p_component_id      => l_component_id,
    p_column_id         => l_column_id,
    p_message           => p_notation_msg,
    p_sert_app_id       => p_sert_app_id,
    p_app_user          => p_app_user,
    p_app_session       => p_app_session,
    p_attribute_set_id  => p_attribute_set_id,
    p_user_workspace_id => p_user_workspace_id
    );

-- Add the notation
INSERT INTO sv_sec_notations
  (
  attribute_set_id,
  application_id,
  attribute_id,
  page_id,
  component_id,
  column_id,
  notation,
  created_by,
  created_on,
  created_ws
  )
VALUES
  (
  p_attribute_set_id,
  p_application_id,
  l_attribute_id,
  l_page_id,
  l_component_id,
  l_column_id,
  p_notation_msg,
  p_app_user,
  SYSDATE,
  p_user_workspace_id
  );

l_dummy := sv_sec.calc_score
  (
  p_attribute_set_id         => p_attribute_set_id,
  p_application_id           => p_application_id,
  p_page_id                  => l_page_id,
  p_request                  => 'PAGE_SCORE',
  p_app_user                 => p_app_user,
  p_workspace_id             => p_workspace_id,
  p_owner                    => l_owner,
  p_user_workspace_id        => p_user_workspace_id
  );

EXCEPTION
WHEN OTHERS THEN
  sv_sec_error.raise_unanticipated;

END save_notation;


--------------------------------------------------------------------------------
-- PROCEDURE: D E L E T E _ N O T A T I O N
--------------------------------------------------------------------------------
-- Deletes a specific Notation
--------------------------------------------------------------------------------
PROCEDURE delete_notation
  (
  p_notation_id              IN NUMBER
  )
IS
BEGIN

DELETE FROM sv_sec_notations WHERE notation_id = p_notation_id;

END delete_notation;


--------------------------------------------------------------------------------
-- FUNCTION: G E T _ E X C E P T I O N
--------------------------------------------------------------------------------
-- Gets an exception
--------------------------------------------------------------------------------
FUNCTION get_exception
  (
  p_exception_pk             IN VARCHAR2
  )
RETURN VARCHAR2
IS
  l_attribute_id             NUMBER;
  l_page_id                  NUMBER;
  l_component_id             VARCHAR2(1000);
  l_column_id                NUMBER;
  l_justification            VARCHAR2(4000);
  l_rejection                VARCHAR2(4000);
  l_scope                    VARCHAR2(100);
  l_pk                       apex_application_global.vc_arr2;    
BEGIN

-- Parse through the p_exception_pk and decompose into individual items
l_pk := apex_util.string_to_table(p_exception_pk);

-- Loop through the table and assign each component
-- String should conform to this: ATTRIBUTE_ID:PAGE_ID:COMPONENT_ID:COLUMN_ID
FOR x IN 1..l_pk.COUNT
LOOP
  CASE 
    WHEN x = 1 THEN l_scope        := l_pk(x);
    WHEN x = 2 THEN l_attribute_id := l_pk(x);    
    WHEN x = 3 THEN l_page_id      := l_pk(x);
    WHEN x = 4 THEN l_component_id := l_pk(x);
    WHEN x = 5 THEN l_column_id    := l_pk(x);
  END CASE;
END LOOP;

-- Fetch the Justification for the attribute
SELECT 
  justification 
  || '|' 
  || 'Added by ' || created_by || ' on ' || TO_CHAR(created_on,'DD-MON-YYYY HH:MIPM') 
  || DECODE(rejected_by, NULL, NULL, '<br />Rejected by ' || rejected_by || ' on ' || TO_CHAR(rejected_on,'DD-MON-YYYY HH:MIPM'))
  || DECODE(approved_by, NULL, NULL, '<br />Approved by ' || approved_by || ' on ' || TO_CHAR(approved_on,'DD-MON-YYYY HH:MIPM'))
  || '|' || rejection
INTO 
  l_justification
FROM 
  sv_sec_exceptions
WHERE 
  application_id = v('P200_APPLICATION_ID')
  AND attribute_set_id = v('P0_ATTRIBUTE_SET_ID')
  AND attribute_id = l_attribute_id
  AND
    CASE 
      WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND l_column_id IS NULL AND page_id = l_page_id THEN 1
      WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NULL AND page_id = l_page_id AND component_id = l_component_id THEN 1
      WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NOT NULL AND page_id = l_page_id AND component_id = l_component_id AND column_id = l_column_id THEN 1
      ELSE 0
    END = 1;

-- Return the Justification
RETURN l_justification;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_exception;


--------------------------------------------------------------------------------
-- FUNCTION: G E T _ A P P R O V A L
--------------------------------------------------------------------------------
-- Gets an approval, if one exists
--------------------------------------------------------------------------------
FUNCTION get_approval
  (
  p_exception_pk             IN VARCHAR2
  )
RETURN VARCHAR2
IS
  l_attribute_id             NUMBER;
  l_page_id                  NUMBER;
  l_component_id             VARCHAR2(1000);
  l_column_id                NUMBER;
  l_approval                 VARCHAR2(4000);
  l_rejection                VARCHAR2(4000);
  l_pk                       apex_application_global.vc_arr2;    
BEGIN

-- Parse through the p_exception_pk and decompose into individual items
l_pk := apex_util.string_to_table(p_exception_pk);

-- Loop through the table and assign each component
-- String should conform to this: ATTRIBUTE_ID:PAGE_ID:COMPONENT_ID:COLUMN_ID
FOR x IN 1..l_pk.COUNT
LOOP
  CASE 
    WHEN x = 1 THEN l_attribute_id := l_pk(x);    
    WHEN x = 2 THEN l_page_id      := l_pk(x);
    WHEN x = 3 THEN l_component_id := l_pk(x);
    WHEN x = 4 THEN l_column_id    := l_pk(x);
  END CASE;
END LOOP;

-- Fetch the Justification for the attribute
FOR x IN 
  (SELECT 
    'Approved by ' || approved_by || ' on ' 
      || TO_CHAR(approved_on,'DD-MON-YYYY HH:MIPM') approval
  FROM 
    sv_sec_exceptions
  WHERE 
    application_id = v('P200_APPLICATION_ID')
    AND attribute_set_id = v('P0_ATTRIBUTE_SET_ID')
    AND attribute_id = l_attribute_id
    AND approved_flag = 'Y'
    AND
      CASE 
        WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND l_column_id IS NULL AND page_id = l_page_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NULL AND page_id = l_page_id AND component_id = l_component_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NOT NULL AND page_id = l_page_id AND component_id = l_component_id AND column_id = l_column_id THEN 1
        ELSE 0
      END = 1
  )
LOOP
  l_approval := x.approval;
END LOOP;

-- Return the Approval
RETURN l_approval;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_approval;

--------------------------------------------------------------------------------
-- PROCEDURE: D E L E T E _ E X C E P T I O N
--------------------------------------------------------------------------------
-- Deletes an exception
--------------------------------------------------------------------------------
PROCEDURE delete_exception
  (
  p_exception_pk             IN VARCHAR2
  )
IS
  l_scope                    VARCHAR2(100);
  l_attribute_id             NUMBER;
  l_page_id                  NUMBER;
  l_component_id             VARCHAR2(1000);
  l_column_id                NUMBER;
  l_justification            VARCHAR2(4000);
  l_pk                       apex_application_global.vc_arr2;    
BEGIN

-- Parse through the p_exception_pk and decompose into individual items
l_pk := apex_util.string_to_table(p_exception_pk,'|');

-- Loop through the table and assign each component
-- String should conform to this: ATTRIBUTE_ID:PAGE_ID:COMPONENT_ID:COLUMN_ID
FOR x IN 1..l_pk.COUNT
LOOP
  CASE 
    WHEN x = 1 THEN l_scope        := l_pk(x);
    WHEN x = 2 THEN l_attribute_id := l_pk(x);    
    WHEN x = 3 THEN l_page_id      := l_pk(x);
    WHEN x = 4 THEN l_component_id := l_pk(x);
    WHEN x = 5 THEN l_column_id    := l_pk(x);
  END CASE;
END LOOP;

-- Delete the exception
  DELETE FROM sv_sec_exceptions WHERE
    application_id = v('P200_APPLICATION_ID')
    AND attribute_set_id = v('P0_ATTRIBUTE_SET_ID') 
    AND attribute_id = l_attribute_id
    AND
      CASE 
        WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND l_column_id IS NULL AND page_id = l_page_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NULL AND page_id = l_page_id AND component_id = l_component_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NOT NULL AND page_id = l_page_id AND component_id = l_component_id AND column_id = l_column_id THEN 1
        ELSE 0
      END = 1;

-- Update the Collection
  UPDATE sv_sec_collection_data SET 
    exception = '<i class="fa fa-plus-circle" style="color:green;"></i>', 
    exception_url = 'f?p=' || v('APP_ID') || ':10:' || v('APP_SESSION') || ':::10:P10_EXCEPTION_PK:' || 'IND|' || attribute_id || '|' || page_id || '|' || component_id || '|' || column_id,
    result = 'FAIL'   
  WHERE
    attribute_id = l_attribute_id
    AND collection_id = SYS_CONTEXT('SV_SERT_CTX', 'COLLECTION_ID')
    AND
      CASE 
        WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND l_column_id IS NULL AND page_id = l_page_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NULL AND page_id = l_page_id AND component_id = l_component_id THEN 1
        WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND l_column_id IS NOT NULL AND page_id = l_page_id AND component_id = l_component_id AND column_id = l_column_id THEN 1
        ELSE 0
      END = 1;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END delete_exception;


--------------------------------------------------------------------------------
-- PROCEDURE: A P P L Y _ E X C E P T I O N S
--------------------------------------------------------------------------------
-- Applies all exceptions
--------------------------------------------------------------------------------
PROCEDURE apply_exceptions
  (
  p_collection_id            IN NUMBER,
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_app_user                 IN VARCHAR2,
  p_attribute_id             IN NUMBER DEFAULT NULL,
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_sert_app_id              IN VARCHAR2 DEFAULT v('APP_ID'),
  p_user_workspace_id        IN NUMBER   DEFAULT nv('G_WORKSPACE_ID')
  )
IS
  l_is_approver              VARCHAR2(1) := 'N';
BEGIN

-- Determine if the user is an approver
IF sv_sec_util.user_has_role
  (
  p_application_id           => p_application_id,
  p_workspace_id             => p_user_workspace_id,
  p_user_name                => p_app_user,
  p_role_name                => 'SV_SERT_APPROVER:SV_SERT_APPROVER_ALL'
  ) = TRUE 
THEN
  l_is_approver := 'Y';
END IF;

-- Set the status to S in the Exceptions table for those that are stale
MERGE INTO sv_sec_exceptions e
USING
  (
  SELECT 
    * 
  FROM 
    sv_sec_collection_data 
  WHERE 
    result != 'PASS'
    AND CASE
      WHEN p_attribute_id IS NOT NULL AND attribute_id = p_attribute_id THEN 1
      WHEN p_attribute_id IS NULL THEN 1
      ELSE 0
    END = 1
    AND collection_id = p_collection_id
    AND application_id = p_application_id
  ) cd
ON 
  (
  cd.application_id = e.application_id
  AND cd.attribute_id = e.attribute_id
  AND
  CASE 
    WHEN cd.page_id IS NOT NULL AND cd.component_id IS NULL     AND cd.column_id IS NULL     AND cd.page_id = e.page_id THEN 1
    WHEN cd.page_id IS NOT NULL AND cd.component_id IS NOT NULL AND cd.column_id IS NULL     AND cd.page_id = e.page_id AND cd.component_id = e.component_id THEN 1
    WHEN cd.page_id IS NOT NULL AND cd.component_id IS NOT NULL AND cd.column_id IS NOT NULL AND cd.page_id = e.page_id AND cd.component_id = e.component_id AND cd.column_id = e.column_id THEN 1
    ELSE 0
  END = 1
  AND e.checksum != cd.checksum
  AND
    CASE
      WHEN p_attribute_id IS NOT NULL AND e.attribute_id = p_attribute_id THEN 1
      WHEN p_attribute_id IS NULL THEN 1
      ELSE 0
    END = 1
    AND e.attribute_set_id = p_attribute_set_id
  )
WHEN MATCHED THEN
  UPDATE SET e.approved_flag = 'S', e.prev_approved_flag = DECODE(e.prev_approved_flag, NULL, e.approved_flag, e.prev_approved_flag);

-- Delete all types of exceptions that now resolve to PASS by default
FOR x IN (SELECT * FROM sv_sec_collection_data WHERE collection_id = p_collection_id AND result = 'PASS')
LOOP

  DELETE FROM sv_sec_exceptions e WHERE
    application_id = p_application_id
    AND attribute_set_id = p_attribute_set_id
    AND attribute_id = x.attribute_id
    AND
    CASE 
      WHEN x.page_id IS NOT NULL AND x.component_id IS NULL     AND x.column_id IS NULL     AND x.page_id = e.page_id THEN 1
      WHEN x.page_id IS NOT NULL AND x.component_id IS NOT NULL AND x.column_id IS NULL     AND x.page_id = e.page_id AND x.component_id = e.component_id THEN 1
      WHEN x.page_id IS NOT NULL AND x.component_id IS NOT NULL AND x.column_id IS NOT NULL AND x.page_id = e.page_id AND x.component_id = e.component_id AND x.column_id = e.column_id THEN 1
      ELSE 0
    END = 1;

END LOOP;

-- Reapply all exceptions via MERGE call
MERGE INTO sv_sec_collection_data cd
USING
  (
  SELECT
    * 
  FROM 
    sv_sec_exceptions
  WHERE 
    attribute_set_id = p_attribute_set_id
    AND application_id = p_application_id
    AND CASE
      WHEN p_attribute_id IS NOT NULL AND attribute_id = p_attribute_id THEN 1
      WHEN p_attribute_id IS NULL THEN 1
      ELSE 0
    END = 1
  ) e
ON 
  (
  e.application_id = cd.application_id
  AND e.attribute_id = cd.attribute_id
  AND
  CASE 
    WHEN e.page_id IS NOT NULL AND e.component_id IS NULL     AND e.column_id IS NULL     AND e.page_id = cd.page_id THEN 1
    WHEN e.page_id IS NOT NULL AND e.component_id IS NOT NULL AND e.column_id IS NULL     AND e.page_id = cd.page_id AND e.component_id = cd.component_id THEN 1
    WHEN e.page_id IS NOT NULL AND e.component_id IS NOT NULL AND e.column_id IS NOT NULL AND e.page_id = cd.page_id AND e.component_id = cd.component_id AND e.column_id = cd.column_id THEN 1
    ELSE 0
  END = 1
  AND CASE
    WHEN p_attribute_id IS NOT NULL AND cd.attribute_id = p_attribute_id THEN 1
    WHEN p_attribute_id IS NULL THEN 1
    ELSE 0
  END = 1
  AND cd.collection_id = p_collection_id
  AND cd.application_id = p_application_id
  )
WHEN MATCHED THEN
  UPDATE SET 
    cd.exception_id = e.exception_id,
    cd.result = DECODE(cd.result, 'PASS', 'PASS', DECODE(e.approved_flag, 'P', 'PENDING', 'R', 'REJECTED', 'S', 'STALE', 'APPROVED')),
    cd.exception = DECODE(cd.result, 'PASS', NULL, DECODE
    (
    e.approved_flag,
    'P', -- PENDING
      CASE
      -- Approver
      WHEN l_is_approver = 'Y' AND e.created_by||e.created_ws != p_app_user||p_user_workspace_id THEN
        '<i class="fa fa-pencil-square" style="color:orange;"></i>'
      -- Owner
      WHEN e.created_by||e.created_ws = p_app_user||p_user_workspace_id THEN
        '<i class="fa fa-pencil-square" style="color:green;"></i>'
      ELSE 
      -- Viewer
        '<i class="fa fa-info-circle" style="color:orange;"></i>'
      END,
    'R', -- REJECTED
      CASE
      -- Rejected and Owner
      WHEN e.created_by||e.created_ws = p_app_user||p_user_workspace_id THEN
        '<i class="fa fa-pencil-square" style="color:red;" title="Rejected by ' || e.rejected_by || ' on ' || TO_CHAR(e.rejected_on, 'DD-MON-YYYY HH:MIPM') || '"></i>'
      ELSE
      -- Rejected and Not Owner
        '<i class="fa fa-info-circle" style="color:red;" title="Rejected by ' || e.rejected_by || ' on ' || TO_CHAR(e.rejected_on, 'DD-MON-YYYY HH:MIPM') || '"></i>'
      END,
    'S', -- STALE
      CASE
      -- Failed and Owner
      WHEN e.created_by = p_app_user THEN
        '<i class="fa fa-info-circle" style="color:red;"></i>'
      ELSE
      -- Failed and Not Owner
        '<i class="fa fa-info-circle" style="color:red;"></i>'
      END,
    'Y',
      CASE
      -- Approved and Owner
      WHEN e.created_by||e.created_ws = p_app_user||p_user_workspace_id THEN
        '<i class="fa fa-pencil-square" style="color:green;" title="Approved by ' || e.approved_by || ' on ' || TO_CHAR(e.approved_on, 'DD-MON-YYYY HH:MIPM') || '"></i>'
      ELSE
      -- Approved and Not Owner
        '<i class="fa fa-info-circle" style="color:green;" title="Approved by ' || e.approved_by || ' on ' || TO_CHAR(e.approved_on, 'DD-MON-YYYY HH:MIPM') || '"></i>'
      END,
      NULL
      )
    ),
    cd.exception_url = DECODE(cd.result, 'PASS', NULL, DECODE
    (
    e.approved_flag,
    'P',
      CASE
      -- Approver
      WHEN l_is_approver = 'Y' AND e.created_by||e.created_ws != p_app_user||p_user_workspace_id THEN
        'f?p=' || p_sert_app_id || ':10:' || p_app_session || ':VIEW::10:P10_EXCEPTION_PK:' || 'IND|' || attribute_id || '|' || page_id || '|' || component_id || '|' || column_id
      -- Owner
      WHEN e.created_by||e.created_ws = p_app_user||p_user_workspace_id THEN
        'f?p=' || p_sert_app_id || ':10:' || p_app_session || ':VIEW::10:P10_EXCEPTION_PK:' || 'IND|' || attribute_id || '|' || page_id || '|' || component_id || '|' || column_id
      ELSE 
      -- Viewer
        'f?p=' || p_sert_app_id || ':10:' || p_app_session || ':VIEW::10:P10_EXCEPTION_PK:' || 'IND|' || attribute_id || '|' || page_id || '|' || component_id || '|' || column_id
      END,
    'R',
      CASE
      -- Rejected and Owner
      WHEN e.created_by||e.created_ws = p_app_user||p_user_workspace_id THEN
        'f?p=' || p_sert_app_id || ':14:' || p_app_session || ':::14:P14_EXCEPTION_PK:' || 'IND|' || attribute_id || '|' || page_id || '|' || component_id || '|' || column_id
      ELSE
      -- Rejected and Not Owner
        'f?p=' || p_sert_app_id || ':14:' || p_app_session || ':::14:P14_EXCEPTION_PK:' || 'IND|' || attribute_id || '|' || page_id || '|' || component_id || '|' || column_id
      END,
    'S',
      CASE
      -- Failed and Owner
      WHEN e.created_by = p_app_user THEN
        'f?p=' || p_sert_app_id || ':16:' || p_app_session || ':::16:P16_EXCEPTION_PK:' || 'IND|' || attribute_id || '|' || page_id || '|' || component_id || '|' || column_id
      ELSE
      -- Failed and Not Owner
        'f?p=' || p_sert_app_id || ':16:' || p_app_session || ':::16:P16_EXCEPTION_PK:' || 'IND|' || attribute_id || '|' || page_id || '|' || component_id || '|' || column_id
      END,
    'Y',
      CASE
      -- Approved and Owner
      WHEN e.created_by||e.created_ws = p_app_user||p_user_workspace_id THEN
        'f?p=' || p_sert_app_id || ':12:' || p_app_session || ':::12:P12_EXCEPTION_PK:' || 'IND|' || attribute_id || '|' || page_id || '|' || component_id || '|' || column_id
      ELSE
      -- Approved and Not Owner
        'f?p=' || p_sert_app_id || ':12:' || p_app_session || ':::12:P12_EXCEPTION_PK:' || 'IND|' || attribute_id || '|' || page_id || '|' || component_id || '|' || column_id
      END,
      NULL
      )
    );
    
EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END apply_exceptions;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END sv_sec_exception;
/