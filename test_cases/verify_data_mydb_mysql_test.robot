| *** Settings ***    |

| Resource            | ../resources/setup_test.resource
| Library             | OperatingSystem
| Library             | DatabaseLibrary

| Suite Setup         | My NewSetupTest
| Suite Teardown      | Disconnect From Database


| *** Test Cases ***            |                 |

| Empty Employees List          | [Documentation] | check person table exists in mydb database
| | table must exist            |  ORDERS 

| Test nuevo                    | [Documentation] | check nuevo
| | Row Count Is Equal To X     | SELECT ORDER_ID FROM ORDERS  | 75 | True

