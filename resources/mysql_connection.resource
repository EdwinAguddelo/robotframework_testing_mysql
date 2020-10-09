*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem

*** Variables ***
${DBName}       mydb
${DBUser}       root
${DBPass}       root
${DBHost}       127.0.0.1
${DBPort}       3306

*** Keywords ***
Connect to databaseMysql
    ${output}   Connect To Database     pymysql     ${DBName}       ${DBUser}       ${DBPass}       ${DBHost}       ${DBPort}
    log to console  ${output}
    should be equal as strings   ${output}    None
    [Return]    ${output}
