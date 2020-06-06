import pytest

string_list = [("this is a test", "this%20is%20a%20test"), ("   ", "%20%20%20"), ("", "")]


@pytest.mark.parametrize(("test_string, expected_string"), string_list)
def test_convert_to_url_using_python_replace(test_string, expected_string):
    output = test_string.replace(" ", "%20")
    assert output == expected_string, "Expected={}, received={}".format(expected_string, output)
