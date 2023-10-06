# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []
#
# Input: string
# Output: array of strings representing substrings which are palindromes in string
#
# Rules:
# - Give all of them, not only the first occurence
# - return empty array for empty string or no palindromes found
# - Case sensitive palindromes
