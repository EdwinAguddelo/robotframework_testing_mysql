import unittest

from plone.testing import layered
from robotsuite import RobotTestSuite
import robotsuite

def test_suite():
    suite = unittest.TestSuite()
    suite.addTests([
        robotsuite.RobotTestSuite('../test_case/verify_data_mydb_mysql_test.robot')
    ])
    return suite


if __name__ == '__main__':
    runner = unittest.TextTestRunner()
    runner.run(test_suite())