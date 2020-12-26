*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem

*** Variables ***
${DBUser}       datical
${DBPass}       admin
${DBHost}       127.0.0.1
${DBPort}       5432
${oracle_driver}       ./resources/test_data/ojdbc6.jar


*** Keywords ***
Connect to database origen

    ${output}   Connect To Database Using Custom Params    cx_Oracle    'datical/admin@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DESKTOP-MMLHIU2)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)))'
    log to console  ${output}
    should be equal as strings   ${output}    None
    [Return]    ${output}
