*** Settings ***
Library         OperatingSystem
Library         DatabaseLibrary
Library         DateTime
Resource        ../resources/db_connection.resource

Suite Setup     Db connection
Suite Teardown      Disconnect From Database

*** Variables ***
${inc_price}        7

*** Test Cases ***
the trigger should save the update in the update_products table
    
    ${output}   Execute Sql String   update products set price = price + ${inc_price} where article_id = 'AR01';
    should be equal as strings  ${output}   None
    ${query}    query   SELECT (new_price - old_price) as diff_price ,modification_date FROM mydb.update_products where old_article_id = 'AR01' order by modification_date desc;
    should be equal as integers     ${query[0][0]}     ${inc_price}         
          

    