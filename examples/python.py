import os

@requires_authorization
def somefunc(param1='', param2=0):
    r'''A docstring'''
    if param1 > param2: # interesting
        print 'Gre\'ater'
    return (param2 - param1 + 1) or None

class SomeClass:
    def cats(arg):
        abc = 1
        deg = [1, 2, '3', "4"]

    def another(arg):
        pass

>>> message = '''interpreter
... prompt'''
