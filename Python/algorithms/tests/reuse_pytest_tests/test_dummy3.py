import pytest
from test_dummy import TestParent  # everything in public namespace is executed here


class TestChild(object):  # Dont inherit from test class
    def test_child1(self):
        print("\nchild1")



"""Output of this file as is:-
» pytest -s Python/algorithms/tests/reuse_pytest_tests/test_dummy3.py                                        
===================================================================================== test session starts ======================================================================================
platform darwin -- Python 3.7.3, pytest-5.4.2, py-1.8.1, pluggy-0.13.1
rootdir: /Users/anjali/Downloads/GitCode/learning-algorithms
collected 7 items                                                                                                                                                                              

Python/algorithms/tests/reuse_pytest_tests/test_dummy3.py 
test1
.test2
.test3
.test4
.test5
.test6
.
child1
.

====================================================================================== 7 passed in 0.02s =======================================================================================
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
»                         

"""
