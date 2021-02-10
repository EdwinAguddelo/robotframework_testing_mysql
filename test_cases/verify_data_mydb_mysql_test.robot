*** Settings ***

Library     OperatingSystem
Library         DatabaseLibrary
Resource        ../resources/connection_database.resource

Suite Setup         Connect to database origen
Suite Teardown      Disconnect From Database


*** Test Cases ***

check person table exists in mydb database
    table must exist     DATICAL.ORDERS

check Michael record present in person table
    check if exists in database     SELECT ORDER_ID FROM DATICAL.ORDERS WHERE ORDER_ID = 105   True

verify row count is equal to one
    row count is equal to x     SELECT ORDER_ID FROM DATICAL.ORDERS WHERE ORDER_ID = 105       1    True

verify row count is greater than zero
    row count is greater than x     SELECT ORDER_ID FROM DATICAL.ORDERS WHERE ORDER_ID = 105     0

check Rigo record not present in person table
    check if not exists in database     SELECT ORDER_ID FROM DATICAL.ORDERS WHERE ORDER_ID = 105

verify row count is zero
    row count is 0      SELECT ORDER_ID FROM DATICAL.ORDERS WHERE ORDER_ID = 105

verify row count is less than one
    row count is less than x        SELECT ORDER_ID FROM DATICAL.ORDERS WHERE ORDER_ID = 105     1

       







