  
| *** Settings ***    |
| Resource            | ../resources/connection_database.resource
| Library             | ../resources/access_secrets.py


| *** Variables ***   | 
| ${SecretName}       | pruebas-base-de-datos

*** Keywords ***
My NewSetupTest 
    Connect to database origen