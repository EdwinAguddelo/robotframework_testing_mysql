from robot.api.deco import keyword
import subprocess
from robot.libraries.BuiltIn import BuiltIn
import boto3
import base64
from botocore.exceptions import ClientError

ROBOT_LIBRARY_VERSION = '0.1'
ROBOT_AUTO_KEYWORDS = False


@keyword(name="Prueba Para Llamado")
def prueba_para_llamado(variable):
    """
    Prueba Para Llamado 

    Arguments: 
     - ''variable''   cualquier valor 
    Examples

    | Prueba Para Llamado | ../prueba.py
    """
    secret_name = “pruebas-base-de-datos”
    region_name = “us-west-2”
    # Create a Secrets Manager client
    session = boto3.session.Session()

    client = session.client(
        service_name=’secretsmanager’,
        region_name=region_name
        )
    # In this sample we only handle the specific exceptions for the ‘GetSecretValue’ API.
    # See https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_GetSecretValue.html
    # We rethrow the exception by default.
    try:
    get_secret_value_response = client.get_secret_value(
        SecretId=secret_name
    )
    except ClientError as e:
    if e.response[‘Error’][‘Code’] == ‘DecryptionFailureException’:
        # Secrets Manager can’t decrypt the protected secret text using the provided KMS key.

        # Deal with the exception here, and/or rethrow at your discretion.
        raise e
    else:
    # Decrypts secret using the associated KMS CMK.
    # Depending on whether the secret is a string or binary, one of these fields will be populated.
    if ‘SecretString’ in get_secret_value_response:
        secret = get_secret_value_response[‘SecretString’]
        print(secret)
    else:
        decoded_binary_secret = base64.b64decode(get_secret_value_response[‘SecretBinary’])
    # Your code goes here.


    print(secret)
    BuiltIn().log_to_console(secret)
    
