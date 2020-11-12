*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem

*** Variables ***
${DBName}       mydb
${DBUser}       admin
${DBPass}       root
${DBHost}       127.0.0.1
${DBPort}       49830

*** Keywords ***
Connect to databaseSQLserver
    ${output}   Connect To Database     pymssql     ${DBName}       ${DBUser}       ${DBPass}       ${DBHost}       ${DBPort}
    log to console  ${output}
    should be equal as strings   ${output}    None
    [Return]    ${output}
