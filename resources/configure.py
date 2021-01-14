from collections import namedtuple

def get_variables(environment):
    return {
        "dbconfig": db_config[environment]
    }

DBConfig = namedtuple('DBCONFIG', 'host, user, pwd')

db_config = {
    "local": DBConfig("DESKTOP-MMLHIU2", "datical", "admin")
}