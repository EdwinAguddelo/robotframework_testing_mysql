*** Settings ***
Library         OperatingSystem
Library         DatabaseLibrary
Resource        ../resources/db_connection.resource

Suite Setup     Db connection
Suite Teardown      Disconnect From Database

*** Test Cases ***
function getAverage should return 23
    ${average}      query       select getAverage();
    should be equal as integers     ${average[0][0]}      23        