*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem

*** Variables ***
${DBName}       dvprueba
${DBHost}       demo-instance.cais2valr5ql.us-east-1.rds.amazonaws.com
${DBPort}       5432
*** Keywords ***
Connect to database origen
    ${config}=     Get Secret     pruebas-base-de-datos  
    ${DBUser}=        Set Variable   ${config['dbconfig'].user}
    ${DBPass}=        Set Variable   ${config['dbconfig'].pwd} 
    ${output}       ${output}   Connect To Database     psycopg2     ${DBName}       ${DBUser}       ${DBPass}       ${DBHost}       ${DBPort}
    log to console  ${output}
    should be equal as strings   ${output}    None
    [Return]    ${output}
