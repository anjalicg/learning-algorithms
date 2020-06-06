import pytest

# Run with -s flag to disable output capturing by pytests
string_list = ["this is a string", "uniqe", "", None]


@pytest.mark.parametrize("test_string", string_list)
def test_using_hash(test_string):
    if not test_string:
        assert False
    character_hash = {}
    for ch in test_string:
        if ch in character_hash.keys():
            character_hash[ch] += 1
        else:
            character_hash.update({ch: 1})
    for k, v in character_hash.items():
        assert(v == 1), "{} has {} occurrences, so not unique".format(k, v)


#
#
#
# def test_bit_vector():
#     # use bit vector
#     pass
#
#
# def test_n_log_n():
#     # in nlogn
#     pass

@pytest.mark.parametrize("test_string", string_list)
@pytest.mark.skip
def test_brute_force(test_string):
    if not test_string:
        assert False
    for i in range(0, len(test_string)):
        for j in range(i + 1, len(test_string)):
            assert not ((test_string[i] == test_string[
                j])), "the character in {} is matching the character at {}, so not unique".format(i, j)
