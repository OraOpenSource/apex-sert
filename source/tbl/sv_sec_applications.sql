PROMPT == SV_SEC_APPLICATIONS

CREATE TABLE sv_sec_applications
 (
 application_id              NUMBER        NOT NULL,
 license_key                 VARCHAR2(100) NOT NULL,
 CONSTRAINT sv_sec_applications_pk PRIMARY KEY (application_id)
 )
/