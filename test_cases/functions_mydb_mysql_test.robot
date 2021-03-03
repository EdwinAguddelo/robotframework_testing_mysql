*** Settings ***
Library         OperatingSystem
Library         DatabaseLibrary
Resource        ../resources/mysql_connection.resource

Suite Setup     Connect to databaseMysql
Suite Teardown      Disconnect From Database

*** Test Cases ***
function getAverage should return 23
    ${average}      query       select getAverage();
    should be equal as integers     ${average[0][0]}      23  
    
stored procedure example
    check that user_procedure creates a new user
    ${output}       Execute Sql String      call user_procedure(3,'Jorge',1234,'calle3yz','new')
    should be equal as strings  ${output}   None
    row count is equal to x     select * from user where user_name ='Jorge'     1
    
