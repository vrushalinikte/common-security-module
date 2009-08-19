# Replace the <<database_name>> with proper database name that is to be migrated.

USE <<database_name>>;

ALTER TABLE CSM_USER MODIFY COLUMN LOGIN_NAME VARCHAR(500);
ALTER TABLE CSM_USER ADD COLUMN MIGRATED_FLAG BOOL NOT NULL DEFAULT 0;
ALTER TABLE CSM_USER ADD COLUMN PREMGRT_LOGIN_NAME VARCHAR(100) ;


ALTER TABLE CSM_PG_PE MODIFY COLUMN UPDATE_DATE DATE DEFAULT '0000-00-00';

ALTER TABLE CSM_ROLE_PRIVILEGE DROP COLUMN UPDATE_DATE;
ALTER TABLE CSM_USER_PE DROP COLUMN UPDATE_DATE;

ALTER TABLE CSM_FILTER_CLAUSE CHANGE GENERATED_SQL GENERATED_SQL_USER VARCHAR (4000) NOT NULL;
ALTER TABLE CSM_FILTER_CLAUSE ADD COLUMN GENERATED_SQL_GROUP VARCHAR (4000) NOT NULL;