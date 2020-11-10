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

    ${output}   Connect To Database Using Custom Params    jaydebeapi    'oracle.jdbc.driver.OracleDriver','jdbc:oracle:thin:@DESKTOP-MMLHIU2:1521:orcl', ['${DBUser}', '${DBPass}'],'${oracle_driver}'   
    log to console  ${output}
    should be equal as strings   ${output}    None
    [Return]    ${output}
