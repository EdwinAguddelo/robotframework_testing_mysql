| *** Settings ***    |


| Library             | OperatingSystem
| Library             | DatabaseLibrary
| Resource            | ../resources/connection_database.resource


| Suite Setup         | Connect to database origen
| Suite Teardown      | Disconnect From Database


| *** Test Cases ***            |                 |


| Empty Employees List          | [Documentation] | check person table exists in mydb database
| | table must exist            |  ORDERS 

| Test nuevo                    | [Documentation] | check nuevo
| | Row Count Is Equal To X     | SELECT ORDER_ID FROM ORDERS WHERE ORDER_ID = 105 | 0 | True


