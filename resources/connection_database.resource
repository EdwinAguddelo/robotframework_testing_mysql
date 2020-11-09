*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem

*** Variables ***
${DBName}       dvdrental
${DBUser}       datical
${DBPass}       admin
${DBHost}       127.0.0.1
${DBPort}       5432
${script_sql}       ./resources/test_data/ojdbc8.jar


${ORACLE DATABASE URL}          jdbc:oracle:thin:@localhost:1521:datical
${ORACLE DATABASE USER}         datical
${ORACLE DATABASE PASSWORD}     admin
${ORACLE DATABASE DRIVER}       oracle.jdbc.driver.OracleDriver


*** Keywords ***
Connect to database origen

    ${output}   Connect To Database Using Custom Params    jaydebeapi    'oracle.jdbc.driver.OracleDriver','jdbc:oracle:thin:@DESKTOP-MMLHIU2:1521:orcl', ['datical', 'admin'],'${script_sql}'   
    log to console  ${output}
    should be equal as strings   ${output}    None
    [Return]    ${output}
