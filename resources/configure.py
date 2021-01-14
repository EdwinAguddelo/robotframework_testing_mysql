from collections import namedtuple
import yaml

def get_variables(environment):
    with open (r'.\resources\configsecurity.yaml') as yamlfile:
        fruit = yaml.load(yamlfile,Loader=yaml.FullLoader)
        DBConfig = namedtuple('DBCONFIG', 'host, user, pwd')
    DBConfig = namedtuple('DBCONFIG', 'host, user, pwd')

    db_config = {
        "local": DBConfig(fruit['host'], fruit['usuario'], fruit['password'])
    }
    return {
        "dbconfig": db_config[environment]
    }
        