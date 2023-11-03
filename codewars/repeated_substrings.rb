# For a given nonempty string s find a minimum substring t and the maximum number k,
# such that the entire string s is equal to t repeated k times.

# The input string consists of lowercase latin letters.

# Your function should return :

# an array [t, k] (in Ruby and JavaScript)
# in C, return k and write to the string t passed in parameter
# Example #1:

# for string

# s = "ababab";
# the answer is

# ("ab", 3)
# Example #2:

# for string

# s = "abcde"
# the answer is

# ("abcde", 1)
# because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.
#
=begin
PROBLEM
----------------
INPUT: Nonempty string
OUTPUT: Array of minimum substring and the times it is in the original string

RULES:
-If two substrings have equal number of occurences, the longer string must be returned.
- The input string will always be a number of times a substring is repeated

EXAMPLES
----------------
BEGIN: "abaabaabaaba" 12 char
=> "a" * string.size / "a".size == 'abaabaabaaba' - 0 - 0
=> "ab" * string.size / "ab".size == 'abaabaabaaba' - 0 - 1
=> "aba"
=> "aba" * 4 = BEGIN
END: ["aba", 4]

BEGIN: "abcde"
=> "a" * 5 / 1 == 'abcde' FALSE
=> "ab" * 5 / 2 == 'abcde' FALSE
END: ["abcde", 1]

BEGIN: "abcdeabcde"
=>
END: ["abcde", 2]

BEGIN: "aabbaabb"
=>
END: ["ab", 2]

DATA STRUCTURES
----------------
BEGIN: string
INBETWEEN:
END:


ALGORITHM
----------------

Create a substring with the first character to the index character
Check if substring by the ( string size divided by susbstring size ) is equal to original string
if true return [substring, string size / substring size]
if false add one to the index
=end
def s(s)
  i = 0
  substring = s[0..i]
  until substring * (s.size / substring.size) == s
    i += 1
    substring = s[0..i]
  end
  [substring, s.size / substring.size]
end
def f(str)
  (0..str.size).each do |i|
    sub = str[0..i]
    break [sub, (str.size / sub.size)] if sub * (str.size / sub.size) == str
  end
end

# (0..s.size).each { |i| return [s[0..i], s.size / (i+1)] if s[0..i] * (s.size / (i+1)) == s }

p f("abab")
p f("abcdeabcde")
p f("xyzxyz")
p f("abiobiohubzqdmpisqh")
