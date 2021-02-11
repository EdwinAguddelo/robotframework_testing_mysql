from collections import namedtuple
import yaml

def get_variables(environment):
    with open (r'.\resources\configsecurity.yaml') as yamlfile:
        yaml_local = yaml.load(yamlfile,Loader=yaml.FullLoader)
        DBConfig = namedtuple('DBCONFIG', 'user, pwd')

    db_config = {
        "local": DBConfig(yaml_local['user'], yaml_local['password'])
    }
    return {
        "dbconfig": db_config[environment]
    }
        