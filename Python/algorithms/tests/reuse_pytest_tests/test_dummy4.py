import pytest
from test_dummy import TestParent as T  # "as T" is required else it executed everything here


class TestChild(object):  # Dont inherit from test class
    def test_child1(self):
        print("\nchild1")


class TestChild2(object):
    def test_class2(self):
        print("class 2")

    def test_child2(self):
        print("child2")

    def test_child3(self):
        T().test_2()  # This is an explicit call to reuse a test in that class


"""Output of this file as is:-
» pytest -s Python/algorithms/tests/reuse_pytest_tests/test_dummy4.py                                        
===================================================================================== test session starts ======================================================================================
platform darwin -- Python 3.7.3, pytest-5.4.2, py-1.8.1, pluggy-0.13.1
rootdir: /Users/anjali/Downloads/GitCode/learning-algorithms
collected 4 items                                                                                                                                                                              

Python/algorithms/tests/reuse_pytest_tests/test_dummy4.py 
child1
.class 2
.child2
.test2
.

====================================================================================== 4 passed in 0.01s =======================================================================================
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
»   

"""
