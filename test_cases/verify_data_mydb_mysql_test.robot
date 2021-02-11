| *** Settings ***    |

| Resource            | ../resources/setup_test.resource
| Library             | OperatingSystem
| Library             | DatabaseLibrary

| Suite Setup         | My NewSetupTest
| Suite Teardown      | Disconnect From Database


*** Test Cases ***
check person table exists in mydb database
    table must exist     clientes


       







