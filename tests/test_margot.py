import unittest
from sample import Calc

class Test(unittest.TestCase):
    def test_sample(self):
        calc = Calc()
        self.assertEqual(15, calc.add(10, 5))
