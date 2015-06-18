create or replace
PACKAGE BODY sv_sec_file_mgr
AS

--------------------------------------------------------------------------------
-- PROCEDURE: R U N _ S C R I P T
--------------------------------------------------------------------------------
-- Runs a SQL script
--------------------------------------------------------------------------------
PROCEDURE run_script
  (
  p_file_id                  IN NUMBER,
  p_attribute_set_key        IN VARCHAR2 DEFAULT NULL,
  p_application_id           IN NUMBER DEFAULT NULL,
  p_attribute_set_id         IN NUMBER DEFAULT NULL
  )
AS
 l_script                    BLOB;
 l_lob_length                NUMBER;
 l_script_type               VARCHAR2(255);
 l_offset                    NUMBER       := 1;
 l_BEGIN_DELIMITER           VARCHAR2(10) := 'PROMPT ==';
 l_END_DELIMITER             VARCHAR2(10) := '-->>END';
 l_start_position            NUMBER       := 0;
 l_end_position              NUMBER       := 0;
 l_char_count                NUMBER;
 l_statement                 VARCHAR2(32737);
BEGIN
 --
 -- Get the blob from the table
 --
SELECT
  f.file_contents,
  dbms_lob.getlength(f.file_contents),
  f.script_type
INTO
  l_script,
  l_lob_length,
  l_script_type
FROM
  sv_sec_script_files f
WHERE
  file_id = p_file_id;
  
 --
 -- If the length is > 0 then process
 --
 IF l_lob_length         > 0 THEN

   WHILE l_end_position < l_lob_length
   LOOP
     --
     -- Get the position of the next BEGIN_DELIMITER starting at the current offset
     --
     l_start_position := dbms_lob.instr(l_script, utl_raw.cast_to_raw(l_begin_delimiter), l_offset, 1);
     --
     -- Get the position of the next END_DELIMITER starting at the current offset
     --
     l_end_position := dbms_lob.instr(l_script, utl_raw.cast_to_raw(l_end_delimiter), l_offset, 1);
     --
     -- calculate the number of characters to get using substr
     --
     l_char_count := l_end_position - l_start_position;
     --
     -- get the statement based on the begin and end delimiters
     --
     l_statement := utl_raw.cast_to_varchar2(dbms_lob.substr(l_script, l_char_count, l_start_position));
     --
     -- Now we need to strip the PROMPT and the / off of the statement
     --
     ---- First we strip off the PROMPT by looking for the first line feed.
     l_statement := SUBSTR(l_statement, instr(l_statement, chr(10),1,1)+1);
     --
     ---- Now we strip off everthing after the / where it appears along side a CR
     l_statement := SUBSTR(l_statement, 1, instr(l_statement, '/'||chr(10),1,1)-1);
     --
     --Now that we have the statement, Execute the buggar!
     --
     BEGIN
     IF l_statement IS NOT NULL THEN
       IF l_script_type = 'ATTRIBUTE_SET' THEN
         l_statement := REPLACE(l_statement, '<<ATTRIBUTE_SET_KEY>>', p_attribute_set_key);

       ELSIF l_script_type = 'EXCEPTIONS' THEN       
         l_statement := REPLACE(l_statement, '<<APPLICATION_ID>>', p_application_id);
         l_statement := REPLACE(l_statement, '<<ATTRIBUTE_SET_ID>>', p_attribute_set_id);

       ELSIF l_script_type = 'NOTATIONS' THEN       
         l_statement := REPLACE(l_statement, '<<APPLICATION_ID>>', p_application_id);
         l_statement := REPLACE(l_statement, '<<ATTRIBUTE_SET_ID>>', p_attribute_set_id);

      
       END IF;  
              
       EXECUTE IMMEDIATE l_STATEMENT;
     ELSE
        L_END_POSITION := L_LOB_LENGTH;
     END IF;
     
     EXCEPTION
     WHEN OTHERS THEN
       IF L_SCRIPT_TYPE = 'EXCEPTION' THEN
          -- DO SOMETHING CLEVER HERE
          NULL;
       ELSE
        sv_sec_error.raise_unanticipated(p_error_msg => 'Import Error');
       END IF;

     END;
     --
     -- Set the new offset for finding the next statement
     --
  
       l_offset := l_end_position + 1;     

   END LOOP;
   COMMIT;
 END IF;

-- Delete the file after it is processed
DELETE FROM
  sv_sec_script_files f
WHERE
  file_id = p_file_id;

EXCEPTION
  WHEN OTHERS THEN 
  sv_sec_error.raise_unanticipated();

END run_script;


END sv_sec_file_mgr;