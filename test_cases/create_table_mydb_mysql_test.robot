*** Settings ***
Library         OperatingSystem
Library         DatabaseLibrary

*** Test Cases ***
Create person table
    ${output}   Execute sql string  create table person(id integer,first_name varchar(20),last_name varchar(20))
    log to console  ${output}
    should be equal as strings   ${output}    None
