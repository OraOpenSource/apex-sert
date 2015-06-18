create or replace PACKAGE sv_sec_collections
AS

PROCEDURE create_collection
  (
  p_collection_id            IN NUMBER,
  p_collection_name          IN VARCHAR2,
  p_app_session              IN NUMBER,
  p_query                    IN VARCHAR2,
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER
  );
  
PROCEDURE delete_score_collections;

PROCEDURE create_score_collections
  (
  p_collection_id            IN NUMBER,
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_app_session              IN NUMBER DEFAULT nv('APP_SESSION'),
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER')
  );

END sv_sec_collections;
/