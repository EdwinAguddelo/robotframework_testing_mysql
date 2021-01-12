*** Settings ***
Library         OperatingSystem
Library         DatabaseLibrary
Resource        ../resources/db_connection.resource

Suite Setup     Db connection
Suite Teardown      Disconnect From Database

*** Test Cases ***
Create person table
    ${output}   Execute sql string  create table person(id integer,first_name varchar(20),last_name varchar(20));
    log to console  ${output}
    should be equal as strings   ${output}    None
