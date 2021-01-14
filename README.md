# robotframework_testing_mysql

robot --pythonpath . --include C test.robot

# El init funciona si esta en la carpeta principal, toma cualquier sucarpeta

test_cases\
    funciones\
    procedimientos\
    selects\
    


# Para correr los test se debe colocar la carpeta en general para poder que se loguee
# Es necesario instalar aws_secretsmanager_caching
# Ademas de instalar cx_Oracle

# la cache dura 1 hora

## deactivate exit env

robot --variable DBUser:datical --variable DBPass:admin  --variable SecretName:pruebas-base-de-dato  test_cases\


robot --variable DBUser:datical --variable DBPass:admin test_cases\


pruebas-base-de-datos

# Manejo de tags



robot --variable DBUser:datical --variable DBPass:admin  --variable SecretName:pruebas-base-de-datos test_cases\



  
| *** Settings ***    |
| Resource            | ../resources/connection_database.resource
| Library             | ../resources/access_secrets.py


| *** Variables ***   | 
| ${SecretName}       | pruebas-base-de-datos

*** Keywords ***
My NewSetupTest 
    Get Secret     ${SecretName}
    Connect to database origen





https://stackoverflow.com/questions/49540928/how-to-setup-a-dbconfigfile-for-robotframework-to-be-able-to-hold-different-data



*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem
Library     ../resources/Animal.py

*** Keywords ***
Connect to database origen
    Get Secret     pruebas-base-de-datos
    ${lib}=        Get Library Instance    Animal
    ${web_driver}=    Call Method   ${lib}     get_variables   production
    ${DBUser} =    Get Environment Variable    USER 
    ${DBPass} =    Get Environment Variable    PASSWORD
    ${output}   Connect To Database Using Custom Params    cx_Oracle    '${DBUser}/${DBPass}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DESKTOP-MMLHIU2)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)))'
    log to console  ${output}
    log to console  ${web_driver['dbconfig'].dsn}
    should be equal as strings   ${output}    None
    [Return]    ${output}
