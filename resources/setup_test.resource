  
| *** Settings ***    |
| Resource            | ../resources/connection_database.resource
| Resource            | ../resources/db_connection.resource
| Library             | ../resources/access_secrets.py


| *** Variables ***   | 
| ${enviroment}        

*** Keywords ***
My NewSetupTest 
    Run Keyword IF      '${enviroment}' == 'local'          Connect to database local
    ...  ELSE IF        '${enviroment}' == 'pipeline'         Connect to database origen
    ...  ELSE            Log    setupTest went wrong. Check wheter the variable
    ...                         'enviromentToRunTest' (${enviroment}) is correct. 
    