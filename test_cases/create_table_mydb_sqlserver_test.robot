*** Settings ***
Library         OperatingSystem
Library         DatabaseLibrary
Resource        ../resources/sqlserver_connection.resource

Suite Setup     Connect to databaseSQLserver
Suite Teardown      Disconnect From Database

*** Test Cases ***
Create person table
    ${output}   Execute sql string  create table person(id integer,first_name varchar(20),last_name varchar(20));
    log to console  ${output}
    should be equal as strings   ${output}    None
