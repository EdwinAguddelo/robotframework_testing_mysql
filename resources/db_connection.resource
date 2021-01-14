
*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem
Library     ../resources/configure.py

*** Keywords ***
Connect to database local
    ${lib}=         Get Library Instance    configure
    ${config}=  Call Method   ${lib}     get_variables   local
    ${USER}=        Set Variable   ${config['dbconfig'].user}
    ${PASSWORD}=    Set Variable   ${config['dbconfig'].pwd}    
    ${output}   Connect To Database Using Custom Params    cx_Oracle    '${USER}/${PASSWORD}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DESKTOP-MMLHIU2)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)))'
    log to console  ${output}
    should be equal as strings   ${output}    None
    [Return]    ${output}