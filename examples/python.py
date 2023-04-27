import os
import numpy as np

MAX = 42

def requires_authorization(name: str):
    pass

@requires_authorization("my function")
def somefunc(param1='', param2=0):
    r'''A docstring'''
    if param1 > param2: # interesting
        print('Gre\'ater')
    return (param2 - param1 + 1) or None

class SomeClass:
    '''This is a docstring.
    '''

    def __init__(self):
        self.pets = []

    def cats(arg):
        deg = [1, 2, '3', "4"]
        huh = deg.append(1)
        return { "one": 1, "two": 2.0, "answer": MAX }

    def another(arg):  # oh really?
        pass

message = '''interpreter
... prompt'''

if __name__ == "__main__":
    print(f'this is {4 + 5} and {6 * 7} and {12 % 34}') # who doesn't love f-strings?
    cl = SomeClass()
    c = cl.cats(arg=4)
    sc = sorted(c.items(), key=lambda item: item[1], reverse=True)
