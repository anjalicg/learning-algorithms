import pytest
from test_dummy import TestParent as T  # "as T" is required else it executed everything here


class TestChild(object):  # Dont inherit from test class
    def test_child1(self):
        print("\nchild1")


class TestChild2(T):  # Wherever it is inherited, it is run
    def test_class2(self):
        print("class 2")

    def test_child2(self):
        print("child2")

    def test_child3(self):
        T().test_2()  # This is an explicit call to reuse a test in that class


"""Output of this file as is:-

» pytest -s Python/algorithms/tests/reuse_pytest_tests/test_dummy2.py                                        
===================================================================================== test session starts ======================================================================================
platform darwin -- Python 3.7.3, pytest-5.4.2, py-1.8.1, pluggy-0.13.1
rootdir: /Users/anjali/Downloads/GitCode/learning-algorithms
collected 10 items                                                                                                                                                                             

Python/algorithms/tests/reuse_pytest_tests/test_dummy2.py 
child1
.
test1
.test2
.test3
.test4
.test5
.test6
.class 2
.child2
.test2
.

====================================================================================== 10 passed in 0.02s ======================================================================================
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
»  

"""
