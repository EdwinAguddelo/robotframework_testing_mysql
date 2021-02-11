# robotframework_testing_mysql

rebot --removekeywords name:db_connection.connectdatabaselocal --output output.xml output.xml

robot --variable enviroment:cloud test_cases\verify_data_mydb_mysql_test.robot

Librerias instaladas:

pip install boto3
pip install aws-secretsmanager-caching
pip install psycopg2
pip install robotframework
pip install robotframework-databaselibrary
pip install PyYAML


# Probar ejecucion quitando el yaml
# Configurar rol para la cuenta de ellos - j
# Configurar pipeline - ed
# Configuracion de arquetipo ----- 
# permisos para subir al repo o donde debe ir --- kelly aprobar poder subir trunk ---> 
# bases de datos que se van a probar ---- 
# Casos que impliquen CRUD - CREATE, DELETE, UPDATE <--SELECT-->


# CONFIGURACION ROL PARA ACCEDER AL SECRET- NOMBRE DEL SECRET

# Lanzamiento quitando o modificando reporte

# CONFIGURAR VARIABLES igual que CONFIGURE.py




## REFERENCIAS ###

https://www.mydatahack.com/how-to-make-rds-in-private-subnet-accessible-from-the-internet/

# CODIGO: https://www.mydatahack.com/creating-publicly-accessible-rds-with-cloudformation/
# CODIGO: https://github.com/thinegan/cloudformation-rds
# CODIGO FINAL: https://dev.to/cmiles74/provision-pragmatically-and-programmatically-with-cloudformation-3gni


# ARQUITECTURAS REFERENCIALES : https://dev.to/ptuladhar3/deploy-scalable-highly-available-and-infra-as-code-managed-web-app-on-aws-4klc

-----
SOLUCIONES CFN: https://github.com/getcft/aws-encrypted-rds-cf-template


-----
BASTION EC2 - RDS : https://medium.com/@sumindaniro/create-a-direct-ssh-tunnel-between-an-aws-private-database-and-local-mysql-workbench-38264826687a


# CODIGO DE BASE DE DATOS
https://programmaticponderings.com/2019/08/09/getting-started-with-postgresql-using-amazon-rds-cloudformation-pgadmin-and-python/
https://github.com/garystafford/aws-rds-postgres/blob/master/cfn-templates/rds.template

# SEGURIDAD RDS

https://aws.amazon.com/es/blogs/database/securing-amazon-rds-and-aurora-postgresql-database-access-with-iam-authentication/


# LAMBDA RDS

https://www.doblefactor.com/devops/api-restful-serverless-en-lambda-y-mysql/


# COMPLETA ARQUITECTURA 
https://github.com/aws-samples/aws-aurora-cloudformation-samples



-------------------------------------------------------------------------------------

ROBOT CI/CD : https://medium.com/@milannovovic/robot-framework-ci-cd-with-azure-devops-cf708a64b389



-
-
-
-

OTRAS dependencias

pip install boto3
pip install aws-secretsmanager-caching
pip install psycopg2
pip install robotframework
pip install robotframework-databaselibrary
pip install PyYAML


--- quizas 
pip install botocore




# Explicacion de la configuracion
https://tomgregory.com/jenkins-assume-role-in-another-aws-account/


1. Para el rol que se despliega en la otra cuenta debemos decirle que cualquier role de la cuenta 
   en la que se va asumir el rol, tenga permiso para asumir este rol, siendo de esta manera

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::874520149338:root"
      },
      "Action": "sts:AssumeRole",
      "Condition": {}
    }
  ]
}

- ademas de la politica de permisos en este rol


Lo que decimos es que cualquiera de la cuenta 874520149338 , tiene permiso para asumir este rol, por eso se especifica root


2. Ahora le damos permisos a un rol que atachamos en la ec2 para que pueda asumir de cualquier cuenta, el rol que necesitamos
esto lo hacemos mediante un politica en linea

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "arn:aws:iam::*:role/BCO-SR-ROL-EXECUTE-PERMISSIONS-DEV"
        }
    ]
}

Entonces aqui le dijimos  que puede asumir de cualquier cuenta un rol llamado BCO-SR-ROL-EXECUTE-PERMISSIONS-DEV
para que pueda aseder a ese rol que nos da permisos en la otra cuenta.


# Ellos mandan la cuenta datical por parametros para el rol que despliegan por que ?

https://es.slideshare.net/AmazonWebServices/how-to-become-an-iam-policy-ninja