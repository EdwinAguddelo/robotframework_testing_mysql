| *** Settings ***    |
| Resource            | ../resources/connection_database.resource
| Library             | ../resources/prueba.py 



| Suite Setup          | Connect to database origen
| Suite Teardown       | Disconnect From Database
| | [Setup]            | Prueba Para Llamado  | andres

| *** Variables ***   | 
| ${DBPass}       
