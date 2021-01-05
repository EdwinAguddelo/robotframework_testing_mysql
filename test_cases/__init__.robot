| *** Settings ***    |
| Resource            | ../resources/connection_database.resource
| Library             | ../resources/access_secrets.py


| Suite Setup          | My NewSetupTest 
| Suite Teardown       | Disconnect From Database


| *** Variables ***   | 
| ${SecretName}


*** Keywords ***

My NewSetupTest 
    Connect to database origen
    Get Secret     ${SecretName}
