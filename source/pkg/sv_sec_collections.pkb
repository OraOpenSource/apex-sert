CREATE OR REPLACE PACKAGE BODY sv_sec_collections
AS

PROCEDURE create_collection
  (
  p_collection_id            IN NUMBER,
  p_collection_name          IN VARCHAR2,
  p_app_session              IN NUMBER,
  p_query                    IN VARCHAR2,
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER
  )
IS
  l_query                    VARCHAR2(10000) := p_query;
BEGIN

-- Replace all tokens
l_query := REPLACE(l_query, '#COLLECTION_ID#',    TO_CHAR(p_collection_id));
l_query := REPLACE(l_query, '#COLLECTION_NAME#',  p_collection_name);
l_query := REPLACE(l_query, '#APP_ID#',           TO_CHAR(p_application_id));
l_query := REPLACE(l_query, '#APPLICATION_ID#',   TO_CHAR(p_application_id));
l_query := REPLACE(l_query, '#APP_SESSION#',      TO_CHAR(p_app_session));
l_query := REPLACE(l_query, '#ATTRIBUTE_SET_ID#', TO_CHAR(p_attribute_set_id));
l_query := REPLACE(l_query, '#ATTRIBUTE_SET_ID#', p_attribute_set_id);

--l_query := REPLACE(l_query, 'INSERT', 'INSERT /*+ append */');
-- Execute the Query to Populate the Collection Data
EXECUTE IMMEDIATE ('BEGIN '|| l_query || '; END;');
commit;

EXCEPTION
  WHEN OTHERS THEN
    logger.log_error;
    logger.log(l_query);
    raise_application_error(-20000, DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

END create_collection;


--------------------------------------------------------------------------------
-- PROCECDURE: D E L E T E _ S C O R E _ C O L L E C T I O N S
--------------------------------------------------------------------------------
PROCEDURE delete_score_collections
IS
BEGIN

-- Loop through all score collections and delete them
FOR x IN (SELECT * FROM sv_sec_score_collections WHERE collection_name IS NOT NULL)
LOOP
  IF apex_collection.collection_exists(p_collection_name => x.collection_name) THEN
    apex_collection.delete_collection(p_collection_name => x.collection_name);  
  END IF;
END LOOP;

EXCEPTION
  WHEN OTHERS THEN
    logger.log_error;
    raise_application_error(-20000, DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

END delete_score_collections;


--------------------------------------------------------------------------------
-- PROCECDURE: C R E A T E _ S C O R E _ C O L L E C T I O N S
--------------------------------------------------------------------------------
PROCEDURE create_score_collections
  (
  p_collection_id            IN NUMBER,
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER')
  )
IS
  l_total_col                NUMBER;
  l_count                    NUMBER := 1;
BEGIN

-- Determine how many collections need to be processed
SELECT count(*) INTO l_total_col 
  FROM 
    sv_sec_score_collections sc, 
    sv_sec_attribute_set_attrs asa, 
    sv_sec_attributes a
  WHERE asa.attribute_id = a.attribute_id 
    AND a.score_collection_id = sc.score_collection_id
    AND a.rule_source = 'COLLECTION'
    AND asa.attribute_set_id = p_attribute_Set_id
    AND a.active_flag = 'Y';
    
-- Set the initial progress bar
IF p_app_session > 0 THEN
  IF l_total_col != 0 THEN
    apex_util.set_session_state('G_PROGRESS','Processing - |' || ROUND(l_count /  l_total_col * 100) || '% Complete');
  END IF;
END IF;

-- Loop through all of the collections in an attribute set and process each one
FOR x IN
  (
  SELECT 
    sc.* 
  FROM 
    sv_sec_score_collections sc, 
    sv_sec_attribute_set_attrs asa, 
    sv_sec_attributes a
  WHERE asa.attribute_id = a.attribute_id 
    AND a.score_collection_id = sc.score_collection_id
    AND a.rule_source = 'COLLECTION'
    AND asa.attribute_set_id = p_attribute_set_id
    AND a.active_flag = 'Y'
  )
LOOP

  create_collection(
    p_collection_id    => p_collection_id,
    p_collection_name  => x.collection_name,
    p_app_session      => p_app_session,
    p_application_id   => p_application_id,
    p_query            => x.collection_sql,
    p_attribute_set_id => p_attribute_set_id
    );  

  IF p_app_session > 0 THEN
    -- Set the Progress Bar
    apex_util.set_session_state('G_PROGRESS','Processing - |' || ROUND(l_count /  l_total_col * 100) || '% Complete');
  END IF;
  
  l_count := l_count + 1;

END LOOP;


EXCEPTION
  WHEN OTHERS THEN
    logger.log_error;
    raise_application_error(-20000, DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

END create_score_collections;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END sv_sec_collections;
/