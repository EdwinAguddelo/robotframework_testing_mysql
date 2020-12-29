from robot.api.deco import keyword
import subprocess

ROBOT_LIBRARY_VERSION = '0.1'
ROBOT_AUTO_KEYWORDS = False


@keyword
def prueba_para_llamado(variable):
    """
    Prueba Para Llamado 

    Arguments: 
     - ''variable''   cualquier valor 
    Examples

    | Prueba Para Llamado | ../prueba.py
    """

    print(variable)
    
