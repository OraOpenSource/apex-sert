PROMPT == SV_SEC_RULE_TYPE

INSERT INTO sv_sec_impact (impact, seq) VALUES ('APPLICATION', 10);
INSERT INTO sv_sec_impact (impact, seq) VALUES ('COLUMN', 20);
INSERT INTO sv_sec_impact (impact, seq) VALUES ('COMPONENT', 30);
INSERT INTO sv_sec_impact (impact, seq) VALUES ('ITEM', 40);
INSERT INTO sv_sec_impact (impact, seq) VALUES ('PAGE', 50);

COMMIT
/