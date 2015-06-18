PROMPT == SV_SEC_RULE_TYPE

INSERT INTO sv_sec_rule_type (rule_type_key, rule_type_name, seq) VALUES ('GREATER_THAN', 'Greater Than', 10);
INSERT INTO sv_sec_rule_type (rule_type_key, rule_type_name, seq) VALUES ('LESS_THAN', 'Less Than', 20);
INSERT INTO sv_sec_rule_type (rule_type_key, rule_type_name, seq) VALUES ('COMPARISON', 'Item Comparison', 30);
INSERT INTO sv_sec_rule_type (rule_type_key, rule_type_name, seq) VALUES ('NOT_NULL', 'Not Null', 40);
INSERT INTO sv_sec_rule_type (rule_type_key, rule_type_name, seq) VALUES ('FUNCTION', 'Function', 50);
INSERT INTO sv_sec_rule_type (rule_type_key, rule_type_name, seq) VALUES ('NONE', 'None', 60);

COMMIT
/