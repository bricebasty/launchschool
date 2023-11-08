# The input is a string str of digits. Cut the string into chunks (a chunk here
# is a substring of the initial string) of size sz (ignore the last chunk if its
# size is less than sz).

# If a chunk represents an integer such as the sum of the cubes of its digits is
#  divisible by 2, reverse that chunk; otherwise rotate it to the left by one
#  position. Put together these modified chunks and return the result as a string.
#
=begin
PROBLEM
----------------
INPUT: String of digits & integer `sz`
OUTPUT: Modified string of digits

RULES:
- Cut the string in substrings of size sz
- If a substring is an integer
--- each digits ^ 2 summed are divisible by 2
----- reverse the substring
--- otherwise rotate the substring to the left by one
- Ignore last chunk if its size is less than sz

EXAMPLES
----------------
BEGIN: "123456987653" & 6
=> ["123456", "987653"]
  => "123456"
  => [1**2, 2**2, 3**2, 4**2, 5**2, 6**2]
  => [1, 4, 9, 16, 25, 36]
  => 91
  => 91 % 2 == 0
  => false
=> [false, "987653"]
  => "987653"
  => [9**2, 8**2, 7**2, 6**2, 5**2, 3**2]
  => [81, 64, 49, 36, 25, 9]
  => 264
  => 264 % 2 == 0
  => true
=> [false, true]
END: "234561356789"

DATA STRUCTURES
----------------
BEGIN:
=>
END:

NOTES:

ALGORITHM
----------------
BEGIN: str = "123456987653" & sz = 6
Split `str` in substrings of size `sz` into a variable called `substr_arrs`
  Create a starting index variable `start_idx` to 0
  => 0
  While starting_index is smaller than str.size - sz
    Push to array `substr_arr`  str from starting_index for `sz` characters in chars
    Increment starting_index by sz
=> [["1", "2", "3", "4", "5", "6"], ["9", "8", "7", "6", "5", "3"]]
Map each array `array` in the resulting array in a new variable called `reverse_substring?_array`
  => ["1", "2", "3", "4", "5", "6"]
  Map into integers each char to the cube
  => [1, 4, 9, 16, 25, 36]
  Sum the resulting array
  => 91
  Check if the return value modulo 2 is equal to 0
  => 91 % 2 == 0
  => false
=> [false, "987653"]
  => "987653"
  => [9**2, 8**2, 7**2, 6**2, 5**2, 3**2]
  => [81, 64, 49, 36, 25, 9]
  => 264
  => 264 % 2 == 0
  => true
=> [false, true]
For each boolean `b` with index `i` in `reverse_substring?_array`
  => false
  if b == true then we reverse the substring of `substr_arr` at index `i`
  if not, we rotate the substring of `substr_arr` at index `i` by 1 to the left
  =>
Return substr_arr joined
END: "234561356789"

=end

def revrot(str, sz)
  return '' if sz <= 0 || str.empty? || sz > str.size

  substr_arr = []
  start_idx = 0

  while start_idx <= str.size - sz
    substr_arr << str[start_idx, sz].chars
    start_idx += sz
  end

  boolean_array = substr_arr.map do |array|
    array.map { |char| char.to_i**2 }.sum.even?
  end

  boolean_array.map.with_index do |b, i|
    b == true ? substr_arr[i].reverse : substr_arr[i].rotate
  end.join
end

p revrot("123456987653", 6) # == "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("", 8) == ""
p revrot("123456779", 0) == ""
p revrot("563000655734469485", 4) == "0365065073456944"
