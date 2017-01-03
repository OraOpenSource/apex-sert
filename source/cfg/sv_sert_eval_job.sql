BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name            => 'SV_SERT_@SV_PARSE_AS@.SV_SERT_EVAL_JOB',
            job_type            => 'STORED_PROCEDURE',
            job_action          => 'SV_SERT_@SV_VERSION@.SV_SEC_SCHEDULER.RUN_SCHED_EVALS',
            number_of_arguments => 0,
            start_date          => TO_DATE((TO_CHAR(SYSDATE,'YYYY-MM-DD HH')||':00:00'),'YYYY-MM-DD HH:MI:SS'),
            repeat_interval     => 'FREQ=HOURLY',
            end_date            => NULL,
            enabled             => FALSE,
            auto_drop           => FALSE,
            comments            => 'APEX-SERT Hourly Job for Scheduled Notifications');

    DBMS_SCHEDULER.SET_ATTRIBUTE( 
            name      => 'SV_SERT_@SV_PARSE_AS@.SV_SERT_EVAL_JOB', 
            attribute => 'logging_level',
            value     => DBMS_SCHEDULER.LOGGING_OFF);
          
    DBMS_SCHEDULER.enable(
             name => 'SV_SERT_@SV_PARSE_AS@.SV_SERT_EVAL_JOB');
END;
/