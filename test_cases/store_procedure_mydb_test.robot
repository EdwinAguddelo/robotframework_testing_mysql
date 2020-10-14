*** Settings ***
Library         OperatingSystem
Library         DatabaseLibrary
Resource        ../resources/mysql_connection.resource

Suite Setup     Connect to databaseMysql
Suite Teardown      Disconnect From Database

*** Variables ***

${id}       1
${user_name}        "Juan"
${telephone}        "123456"
${address}      "cr 56 # 45-23"         


*** Test Cases ***
Insert data into user table
    @{ParamList}    Create List     ${id}       ${user_name}        ${telephone}        ${address}      "new"
    Set Test Variable   ${SPName}   mydb.user_name
    @{QueryResults}     Call Stored Procedure   ${SPName}   ${ParamList}
    Log List    @{QueryResults}
