# All letters except one in a palindrome will be of even count. Atmost one character can have odd count
import pytest

string_list = [("this this", True), ("not a palindrome", False)]


@pytest.mark.parametrize(("test_string, expected_string"), string_list)
def test_permutation_of_palindrome_dictionary(test_string, expected_string):
    print("\n")
    count={}
    for ch in test_string:
        if ch in count:
            count[ch]+=1
        else:
            count.update({ch:1})
    num_odd = 0
    result = True
    print(count)
    for k,v in count.items():
        print("for k={}, v={}".format(k,v))
        if v%2!=0:
            print("num_odd+=1")
            num_odd+=1
        if num_odd>1:
            result = False
            break
    assert result==expected_string



