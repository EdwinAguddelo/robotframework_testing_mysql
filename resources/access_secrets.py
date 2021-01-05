from robot.api.deco import keyword
import subprocess
from robot.libraries.BuiltIn import BuiltIn
import boto3
import base64
from botocore.exceptions import ClientError
from robot.api import logger
from aws_secretsmanager_caching import SecretCache, SecretCacheConfig
import json

import os 

ROBOT_LIBRARY_VERSION = '0.1'
ROBOT_AUTO_KEYWORDS = False


@keyword(name="Get Secret")
def get_secret(secret_name_params):
    """
    Get Secret 

    Arguments: 
     - ''variable''   secret_name 
    Examples

    | Get Secret | ../access_secrets.py
    """
    secret_name = secret_name_params
    region_name = "us-east-1"
    # Create a Secrets Manager client
    
    # https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-api.html 

    session = boto3.session.Session()

    client = session.client(
        service_name='secretsmanager',
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
        if e.response['Error']['Code'] == 'DecryptionFailureException':
            # Secrets Manager can’t decrypt the protected secret text using the provided KMS key.

            # Deal with the exception here, and/or rethrow at your discretion.
            raise e
    else:
    # Decrypts secret using the associated KMS CMK.
    # Depending on whether the secret is a string or binary, one of these fields will be populated.
        if 'SecretString' in get_secret_value_response:
            secret = get_secret_value_response['SecretString']
            logger.console("Ingreso")
            resp_data = json.loads(secret)
            logger.console(resp_data['user'])
            logger.console(resp_data['password'])
            os.environ["USER"] = resp_data['user']
            os.environ["PASSWORD"] = resp_data['password']        
        else:
            decoded_binary_secret = base64.b64decode(get_secret_value_response['SecretBinary'])
    # Your code goes here.
    
