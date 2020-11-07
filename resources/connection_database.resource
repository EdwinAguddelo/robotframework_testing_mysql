*** Settings ***
Library           DatabaseLibrary
Library           OperatingSystem


*** Variables ***
${DB_CONNECT_STRING}    'datical/admin@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DESKTOP-MMLHIU2)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)))'


*** Keywords ***
Connect To DB
    [Arguments]    ${DB_CONNECT_STRING_VALUE}
    Set Environment Variable    PATH    D:\temporal\instantclient_19_6
    Set Global Variable    ${DB_CONNECT_STRING_VALUE}
    #Connect to DB
    Connect To Database Using Custom Params  JayDeBeApi       'DB_CONNECT_STRING_VALUE', 'datical', 'datical', 'admin'

Run Query and log results
    [Arguments]    ${QUERY_TO_EXECUTE}
    Set Global Variable    ${QUERY_TO_EXECUTE}
    ${queryResults}    Query    ${QUERY_TO_EXECUTE}
    log to console    ${queryResults}

Disconnect From DB
    #Disconnect from DB
    disconnect from database


*** Test Cases ***
Connecting
  

  Connect To DB 

  
  @{queryResults}  Query  select * from audits;

  log to console  @{queryResults}

