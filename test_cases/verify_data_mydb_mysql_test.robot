*** Settings ***

Library     OperatingSystem
Library         DatabaseLibrary
Resource        ../resources/db_connection.resource

Suite Setup     Db connection
Suite Teardown      Disconnect From Database


*** Test Cases ***

check person table exists in mydb database
    table must exist     person

check Michael record present in person table
    check if exists in database     select id from mydb.person where first_name = "Michael";

verify row count is equal to one
    row count is equal to x     select * from mydb.person where first_name = "pepito";       1

verify row count is greater than zero
    row count is greater than x     select * from mydb.person where first_name = "james"     0

check Rigo record not present in person table
    check if not exists in database     select id from mydb.person where first_name = "Rigo"

verify row count is zero
    row count is 0      select * from mydb.person where first_name = "Rigo"

verify row count is less than one
    row count is less than x        select * from mydb.person where first_name = "Rigo"     1

       







