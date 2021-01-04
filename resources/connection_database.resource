*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem



*** Keywords ***
Connect to database origen

    ${output}   Connect To Database Using Custom Params    cx_Oracle    '${DBUser}/admin@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DESKTOP-MMLHIU2)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)))'
    log to console  ${output}
    log to console  ${DBPass}   
    should be equal as strings   ${output}    None
    [Return]    ${output}
