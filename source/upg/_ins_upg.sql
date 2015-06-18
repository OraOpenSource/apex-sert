define upgrade_from_user = ''
define upgrade_to_user_s = 'SV_SERT_@SV_VERSION@'

column upgrade_from_user new_val upgrade_from_user_s NOPRINT
--
select max(username) upgrade_from_user FROM dba_users 
  WHERE username LIKE 'SV_SERT_02%' AND username != 'SV_SERT_@SV_VERSION@';
--

set termout on

PROMPT ==
PROMPT == UPGRADING FROM ^upgrade_from_user_s TO ^upgrade_to_user_s
PROMPT ==

@upg/upg_attribute_sets.sql
@upg/upg_attributes.sql
@upg/upg_attribute_values.sql
@upg/upg_attribute_set_attrs.sql
@upg/upg_app_evals.sql
@upg/upg_app_eval_cls.sql
@upg/upg_app_eval_cat.sql
@upg/upg_app_eval_attr.sql
@upg/upg_transactional_data.sql
@upg/upg_events.sql
@upg/upg_exceptions.sql
@upg/upg_notations.sql
@upg/upg_scheduled_results.sql
@upg/upg_increment_sequences.sql
