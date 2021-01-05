*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem

*** Variables ***
${DBUser}=   Get Environment Variable    USER
${DBPass}=   Get Environment Variable    PASSWORD


*** Keywords ***
Connect to database origen

    ${output}   Connect To Database Using Custom Params    cx_Oracle    '${DBUser}/${DBPass}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DESKTOP-MMLHIU2)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)))'
    log to console  ${output}
    should be equal as strings   ${output}    None
    [Return]    ${output}
