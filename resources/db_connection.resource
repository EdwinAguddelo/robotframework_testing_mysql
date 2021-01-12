*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem 

*** Keywords ***
Db connection
    ${output}   Connect To Database  
    log to console  ${output}
    should be equal as strings   ${output}    None
    [Return]    ${output}
