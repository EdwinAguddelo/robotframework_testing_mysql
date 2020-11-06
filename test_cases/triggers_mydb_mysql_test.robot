*** Settings ***
Library         OperatingSystem
Library         DatabaseLibrary
Library         DateTime
Resource        ../resources/connection_database.resource

Suite Setup     Connect to database origen
Suite Teardown      Disconnect From Database

*** Variables ***
${employee_id}        2

*** Test Cases ***
the trigger should save the update in the update_products table
    
    ${output}   Execute Sql String   UPDATE employees SET last_name = 'Brown' WHERE ID = 2;
    should be equal as strings  ${output}   None
    ${query}    query   SELECT employee_id FROM public.employee_audits WHERE employee_id = 2;
    should be equal as integers     ${query[0][0]}     ${employee_id}
          

    