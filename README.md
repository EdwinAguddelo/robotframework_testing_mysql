# robotframework_testing_mysql

robot --pythonpath . --include C test.robot

# El init funciona si esta en la carpeta principal, toma cualquier sucarpeta

test_cases\
    funciones\
    procedimientos\
    selects\
    


# Para correr los test se debe colocar la carpeta en general para poder que se loguee
# Es necesario instalar aws_secretsmanager_caching
# Ademas de instalar cx_Oracle

# la cache dura 1 hora

## deactivate exit env

robot --variable DBUser:datical --variable DBPass:admin  --variable SecretName:pruebas-base-de-dato  test_cases\


robot --variable DBUser:datical --variable DBPass:admin test_cases\


pruebas-base-de-datos

# Manejo de tags



robot --variable DBUser:datical --variable DBPass:admin  --variable SecretName:pruebas-base-de-datos 
 test_cases\