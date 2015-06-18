PROMPT == SV_SEC_RULE_SOURCE

INSERT INTO sv_sec_rule_source (rule_source_key, rule_source_name, seq) VALUES ('COLUMN', 'APEX/eSERT View', 10);
INSERT INTO sv_sec_rule_source (rule_source_key, rule_source_name, seq) VALUES ('COLLECTION', 'Collection', 20);
INSERT INTO sv_sec_rule_source (rule_source_key, rule_source_name, seq) VALUES ('PLSQL', 'PL/SQL Block', 30);

COMMIT
/