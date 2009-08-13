SET TEMP_HOME_31=C:\Vijay\projects\security\software\backwards_compatible_upt\build\CSMUPT_31_PROD_03222006_V1\upt

mkdir webapp
mkdir webapp\public_html
mkdir webapp\public_html\WEB-INF
mkdir webapp\public_html\WEB-INF\lib
copy %TEMP_HOME_31%\webapp\public_html\WEB-INF\lib\spring-1.2.8.jar webapp\public_html\WEB-INF\lib
mkdir webapp\src
copy %TEMP_HOME_31%\webapp\src\ApplicationSecurityConfig.xsd webapp\src
mkdir webapp\src\gov
mkdir webapp\src\gov\nih\nci
mkdir webapp\src\gov\nih\nci\security
mkdir webapp\src\gov\nih\nci\security\upt
mkdir webapp\src\gov\nih\nci\security\upt\actions
copy %TEMP_HOME_31%\webapp\src\gov\nih\nci\security\upt\actions\HomeAction.java webapp\src\gov\nih\nci\security\upt\actions
copy %TEMP_HOME_31%\webapp\src\gov\nih\nci\security\upt\actions\LoginAction.java webapp\src\gov\nih\nci\security\upt\actions
copy %TEMP_HOME_31%\webapp\src\gov\nih\nci\security\upt\actions\LogoutAction.java webapp\src\gov\nih\nci\security\upt\actions\
mkdir webapp\src\gov\nih\nci\security\upt\constants
copy %TEMP_HOME_31%\webapp\src\gov\nih\nci\security\upt\constants\DisplayConstants.java webapp\src\gov\nih\nci\security\upt\constants
mkdir webapp\src\gov\nih\nci\security\upt\resources\
copy %TEMP_HOME_31%\webapp\src\gov\nih\nci\security\upt\resources\csmupt.hibernate.cfg.xml webapp\src\gov\nih\nci\security\upt\resources\
mkdir webapp\src\gov\nih\nci\security\upt\util
mkdir webapp\src\gov\nih\nci\security\upt\util\properties
copy %TEMP_HOME_31%\webapp\src\gov\nih\nci\security\upt\util\properties\AuthorizationInformation.java webapp\src\gov\nih\nci\security\upt\util\properties
copy %TEMP_HOME_31%\webapp\src\gov\nih\nci\security\upt\util\properties\BackwardsCompatibilityInformation.java webapp\src\gov\nih\nci\security\upt\util\properties
mkdir webapp\src\gov\nih\nci\security\upt\util\properties\exceptions 
copy %TEMP_HOME_31%\webapp\src\gov\nih\nci\security\upt\util\properties\exceptions\UPTBackwardsCompatibilityException.java webapp\src\gov\nih\nci\security\upt\util\properties\exceptions
copy %TEMP_HOME_31%\webapp\src\gov\nih\nci\security\upt\util\properties\exceptions\UPTConfigurationException.java webapp\src\gov\nih\nci\security\upt\util\properties\exceptions
copy %TEMP_HOME_31%\webapp\src\gov\nih\nci\security\upt\util\properties\FileHelper.java webapp\src\gov\nih\nci\security\upt\util\properties
copy %TEMP_HOME_31%\webapp\src\gov\nih\nci\security\upt\util\properties\ObjectFactory.java webapp\src\gov\nih\nci\security\upt\util\properties
copy %TEMP_HOME_31%\webapp\src\gov\nih\nci\security\upt\util\properties\StringUtils.java webapp\src\gov\nih\nci\security\upt\util\properties
copy %TEMP_HOME_31%\webapp\src\gov\nih\nci\security\upt\util\properties\UPTApplication.java webapp\src\gov\nih\nci\security\upt\util\properties
copy %TEMP_HOME_31%\webapp\src\gov\nih\nci\security\upt\util\properties\UPTProperties.java webapp\src\gov\nih\nci\security\upt\util\properties
copy %TEMP_HOME_31%\webapp\src\gov\nih\nci\security\upt\util\properties\UPTPropertiesTest.java webapp\src\gov\nih\nci\security\upt\util\properties
copy %TEMP_HOME_31%\webapp\src\upt-beans.xml webapp\src