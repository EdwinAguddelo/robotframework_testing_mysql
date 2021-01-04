| *** Settings ***    |
| Resource            | ../resources/connection_database.resource
| Library             | ../resources/prueba.py


| Suite Setup          | My NewSetupTest 
| Suite Teardown       | Disconnect From Database


| *** Variables ***   | 
| ${DBPass}    


*** Keywords ***

My NewSetupTest 
    Connect to database origen
    Prueba Para Llamado     ${DBPass}
