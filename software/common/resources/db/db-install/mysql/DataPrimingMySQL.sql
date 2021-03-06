/*L
   Copyright Ekagra Software Technologies Ltd.
   Copyright SAIC

   Distributed under the OSI-approved BSD 3-Clause License.
   See http://ncip.github.com/common-security-module/LICENSE.txt for details.
L*/

# 
# The following entries creates a super admin application incase you decide 
# to use this database to run UPT also. In that case you need to provide
# the project login id and name for the super admin.
# However in incase you are using this database just to host the application's
# authorization schema, these enteries are not used and hence they can be left as 
# it is.
#

insert into csm_application(APPLICATION_NAME,APPLICATION_DESCRIPTION,DECLARATIVE_FLAG,ACTIVE_FLAG,UPDATE_DATE)
values ("csmupt","CSM UPT Super Admin Application",0,0,sysdate());

insert into csm_user (LOGIN_NAME,FIRST_NAME,LAST_NAME,PASSWORD,UPDATE_DATE)
values ("SuperAdmin","@super.admin.first.name@","@super.admin.last.name@","zJPWCwDeSgG8j2uyHEABIQ==",sysdate());

 
insert into csm_protection_element(PROTECTION_ELEMENT_NAME,PROTECTION_ELEMENT_DESCRIPTION,OBJECT_ID,APPLICATION_ID,UPDATE_DATE)
values("csmupt","CSM UPT Super Admin Application Protection Element","csmupt",1,sysdate());

insert into csm_user_pe(PROTECTION_ELEMENT_ID,USER_ID)
values(1,1);

# 
# The following entry is for your application. 
# Replace <<application_context_name>> with your application name.
#

INSERT INTO csm_application(APPLICATION_NAME,APPLICATION_DESCRIPTION,DECLARATIVE_FLAG,ACTIVE_FLAG,UPDATE_DATE)
VALUES ("@application.context.name.remote@","@application.context.name.remote@",0,0,sysdate());

insert into csm_protection_element(PROTECTION_ELEMENT_NAME,PROTECTION_ELEMENT_DESCRIPTION,OBJECT_ID,APPLICATION_ID,UPDATE_DATE)
values("@application.context.name.remote@","@application.context.name.remote@","@application.context.name.remote@",1,sysdate());


#
# The following entries are Common Set of Privileges
#

INSERT INTO csm_privilege (privilege_name, privilege_description, update_date)
VALUES("CREATE","This privilege grants permission to a user to create an entity. This entity can be an object, a database entry, or a resource such as a network connection", sysdate());

INSERT INTO csm_privilege (privilege_name, privilege_description, update_date)
VALUES("ACCESS","This privilege allows a user to access a particular resource.  Examples of resources include a network or database connection, socket, module of the application, or even the application itself", sysdate());

INSERT INTO csm_privilege (privilege_name, privilege_description, update_date)
VALUES("READ","This privilege permits the user to read data from a file, URL, database, an object, etc. This can be used at an entity level signifying that the user is allowed to read data about a particular entry", sysdate());

INSERT INTO csm_privilege (privilege_name, privilege_description, update_date)
VALUES("WRITE","This privilege allows a user to write data to a file, URL, database, an object, etc. This can be used at an entity level signifying that the user is allowed to write data about a particular entity", sysdate());

INSERT INTO csm_privilege (privilege_name, privilege_description, update_date)
VALUES("UPDATE","This privilege grants permission at an entity level and signifies that the user is allowed to update data for a particular entity. Entities may include an object, object attribute, database row etc", sysdate());

INSERT INTO csm_privilege (privilege_name, privilege_description, update_date)
VALUES("DELETE","This privilege permits a user to delete a logical entity. This entity can be an object, a database entry, a resource such as a network connection, etc", sysdate());

INSERT INTO csm_privilege (privilege_name, privilege_description, update_date)
VALUES("EXECUTE","This privilege allows a user to execute a particular resource. The resource can be a method, function, behavior of the application, URL, button etc", sysdate());


INSERT CSM_PROTECTION_GROUP (PROTECTION_GROUP_ID, PROTECTION_GROUP_NAME, PROTECTION_GROUP_DESCRIPTION, APPLICATION_ID, LARGE_ELEMENT_COUNT_FLAG, UPDATE_DATE)
VALUES
(1, 'UPT_UI_USERS_LINK', 'Protection Group representing User link in UPT. Do not change the name.', 1, 0, sysdate());

INSERT CSM_PROTECTION_GROUP (PROTECTION_GROUP_ID, PROTECTION_GROUP_NAME, PROTECTION_GROUP_DESCRIPTION, APPLICATION_ID, LARGE_ELEMENT_COUNT_FLAG, UPDATE_DATE)
VALUES
(2, 'UPT_UI_PROTECTION_ELEMENTS_LINK', 'Protection Group representing Protection Element link in UPT. Do not change the name.', 1, 0, sysdate());

INSERT CSM_PROTECTION_GROUP (PROTECTION_GROUP_ID, PROTECTION_GROUP_NAME, PROTECTION_GROUP_DESCRIPTION, APPLICATION_ID, LARGE_ELEMENT_COUNT_FLAG, UPDATE_DATE)
VALUES
(3, 'UPT_UI_PRIVILEGES_LINK', 'Protection Group representing Privilege link in UPT. Do not change the name.', 1, 0, sysdate());

INSERT CSM_PROTECTION_GROUP (PROTECTION_GROUP_ID, PROTECTION_GROUP_NAME, PROTECTION_GROUP_DESCRIPTION, APPLICATION_ID, LARGE_ELEMENT_COUNT_FLAG, UPDATE_DATE)
VALUES
(4, 'UPT_UI_GROUPS_LINK', 'Protection Group representing Group link in UPT. Do not change the name.', 1, 0, sysdate());

INSERT CSM_PROTECTION_GROUP (PROTECTION_GROUP_ID, PROTECTION_GROUP_NAME, PROTECTION_GROUP_DESCRIPTION, APPLICATION_ID, LARGE_ELEMENT_COUNT_FLAG, UPDATE_DATE)
VALUES
(5, 'UPT_UI_PROTECTION_GROUPS_LINK', 'Protection Group representing Protection Group link in UPT. Do not change the name.', 1, 0, sysdate());

INSERT CSM_PROTECTION_GROUP (PROTECTION_GROUP_ID, PROTECTION_GROUP_NAME, PROTECTION_GROUP_DESCRIPTION, APPLICATION_ID, LARGE_ELEMENT_COUNT_FLAG, UPDATE_DATE)
VALUES
(6, 'UPT_UI_ROLE_LINK', 'Protection Group representing Role link in UPT. Do not change the name.', 1, 0, sysdate());

INSERT CSM_PROTECTION_GROUP (PROTECTION_GROUP_ID, PROTECTION_GROUP_NAME, PROTECTION_GROUP_DESCRIPTION, APPLICATION_ID, LARGE_ELEMENT_COUNT_FLAG, UPDATE_DATE)
VALUES
(7, 'UPT_UI_INSTANCE_LEVEL_LINK', 'Protection Group representing Instance Level link in UPT. Do not change the name.', 1, 0, sysdate());

COMMIT;
