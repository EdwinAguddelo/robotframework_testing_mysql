from robot.api.deco import keyword
import subprocess
from robot.libraries.BuiltIn import BuiltIn
import boto3
import base64
from botocore.exceptions import ClientError
from robot.api import logger
from aws_secretsmanager_caching import SecretCache, SecretCacheConfig
import json
from collections import namedtuple
import os 

ROBOT_LIBRARY_VERSION = '0.1'
ROBOT_AUTO_KEYWORDS = False


@keyword(name="Get Secret")
def get_secret(aplicacion):
    """
    Get Secret 

    Arguments: 
     - ''variable''   secret_name 
    Examples

    | Get Secret | ../access_secrets.py
    """
    sts_client = boto3.client('sts')
# Call the assume_role method of the STSConnection object and pass the role
# ARN and a role session name.
# arn:aws:iam::874520149338:role/rol-acceso-a-s3-desde-ec2
    assumed_role_object=sts_client.assume_role(
        RoleArn="arn:aws:iam::874520149338:role/BCO-SR-ROL-EXECUTE-PERMISSIONS-DEV",
        RoleSessionName="AssumeRoleSession1",
        DurationSeconds=1800
    )
# From the response that contains the assumed role, get the temporary 
# credentials that can be used to make subsequent API calls
    credentials=assumed_role_object['Credentials']
    session = boto3.Session(
        aws_access_key_id=credentials['AccessKeyId'],
        aws_secret_access_key=credentials['SecretAccessKey'],
        aws_session_token=credentials['SessionToken'],
        )

    client = session.client(
        service_name='secretsmanager',
        region_name="us-east-1"
    )
    try:
        get_secret_value_response = client.get_secret_value(
            SecretId=aplicacion+"qa-secretrds-CNXDATI"
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
            resp_data = json.loads(secret)
            DBConfig = namedtuple('DBCONFIG','user, pwd')
            db_config = {
                "cloud": DBConfig(resp_data['user'], resp_data['password'])
            }
            return {"dbconfig": db_config["cloud"]}
        else:
            decoded_binary_secret = base64.b64decode(get_secret_value_response['SecretBinary'])
    # Your code goes here.
