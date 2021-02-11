*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem
Library     ../resources/configure.py

*** Variables ***
${DBName}       dvprueba
${DBHost}       demo-instance.cais2valr5ql.us-east-1.rds.amazonaws.com
${DBPort}       5432

*** Keywords ***
Connect to database local
    ${lib}=         Get Library Instance    configure
    ${config}=  Call Method   ${lib}     get_variables   local
    ${DBUser}=        Set Variable   ${config['dbconfig'].user}
    ${DBPass}=        Set Variable   ${config['dbconfig'].pwd}   
    ${output}   Connect To Database     psycopg2     ${DBName}       ${DBUser}       ${DBPass}       ${DBHost}       ${DBPort}
    log to console  ${output}
    should be equal as strings   ${output}    None
    [Return]    ${output}