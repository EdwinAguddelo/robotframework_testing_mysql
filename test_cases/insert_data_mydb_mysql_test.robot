*** Settings ***
Library         OperatingSystem
Library         DatabaseLibrary
Resource        ../resources/mysql_connection.resource

Suite Setup     Connect to databaseMysql
Suite Teardown      Disconnect From Database

*** Variables ***
${script_sql}       ./resources/test_data/mydb_person_insert.sql

*** Test Cases ***
Inserting data in person table
    #${output}   Execute sql string  insert into person values(101,"Edwin","Agudelo");
    ${output}   Execute sql script  ${script_sql}
    log to console  ${output}
    should be equal as strings   ${output}    None