import os
import numpy as np

@requires_authorization
def somefunc(param1='', param2=0):
    r'''A docstring'''
    if param1 > param2: # interesting
        print 'Gre\'ater'  # << syntax error
    return (param2 - param1 + 1) or None

class SomeClass:
    '''This is a docstring
    '''
    def cats(arg):
        abc = 1
        deg = [1, 2, '3', "4"]

    def another(arg):
        pass

>>> message = '''interpreter
... prompt'''

if __name__ == "__main__":
    print(f'this is {4 + 5}')
