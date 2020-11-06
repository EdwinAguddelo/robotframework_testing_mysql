*** Settings ***
Library         OperatingSystem
Library         DatabaseLibrary
Resource        ../resources/connection_database.resource

Suite Setup         Connect to database origen
Suite Teardown      Disconnect From Database

*** Test Cases ***
function getAverage should return 23
    ${average}      query       select get_film_count(40,90);
    should be equal as integers     ${average[0][0]}      325