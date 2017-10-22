from setuptools import setup, find_packages
import sys

sys.path.append('./src')
setup(
    name = 'margot_command',
    version = "0.0.1",
    packages = find_packages(),
    test_suite = 'tests'
)
