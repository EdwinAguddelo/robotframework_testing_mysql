*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem

*** Variables ***
${DBName}       dvdrental
${DBUser}       datical
${DBPass}       admin
${DBHost}       127.0.0.1
${DBPort}       5432

*** Keywords ***
Connect to database origen
    ${output}   Connect To Database     psycopg2     ${DBName}       ${DBUser}       ${DBPass}       ${DBHost}       ${DBPort}
    log to console  ${output}
    should be equal as strings   ${output}    None
    [Return]    ${output}
