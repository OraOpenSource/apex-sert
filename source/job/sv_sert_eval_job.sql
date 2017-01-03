DECLARE
  l_job_exists               NUMBER;
BEGIN

-- Check to see if the job exists, and if so, remove it
SELECT COUNT(*) INTO l_job_exists FROM user_scheduler_jobs WHERE job_name = 'SV_SERT_EVAL_JOB';

IF l_job_exists = 1 THEN
  DBMS_SCHEDULER.DROP_JOB(job_name => 'SV_SERT_@SV_VERSION@.SV_SERT_EVAL_JOB');
END IF;

-- Create the job
DBMS_SCHEDULER.CREATE_JOB 
  (
  job_name            => 'SV_SERT_@SV_VERSION@.SV_SERT_EVAL_JOB',
  job_type            => 'STORED_PROCEDURE',
  job_action          => 'SV_SERT_@SV_VERSION@.SV_SEC_SCHEDULER.RUN_SCHED_EVALS',
  number_of_arguments => 0,
  start_date          => TO_DATE((TO_CHAR(SYSDATE,'YYYY-MM-DD HH')||':00:00'),'YYYY-MM-DD HH:MI:SS'),
  repeat_interval     => 'freq=HOURLY',
  end_date            => NULL,
  enabled             => FALSE,
  auto_drop           => FALSE,
  comments            => 'APEX-SERT Hourly Job for Scheduled Notifications'
  );

DBMS_SCHEDULER.SET_ATTRIBUTE
  ( 
  name      => 'SV_SERT_@SV_VERSION@.SV_SERT_EVAL_JOB', 
  attribute => 'logging_level',
  value     => DBMS_SCHEDULER.LOGGING_OFF
  );
          
DBMS_SCHEDULER.enable
  (
  name => 'SV_SERT_@SV_VERSION@.SV_SERT_EVAL_JOB'
  );

END;
/