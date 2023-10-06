# You are going to be given an array of integers. Your job is to take that array
# and find an index N where the sum of the integers to the left of N is equal
# to the sum of the integers to the right of N. If there is no index that would
# make this happen, return -1.

# For example:

# Let's say you are given the array {1,2,3,4,3,2,1}:
# Your function will return the index 3, because at the 3rd position of the array,
#  the sum of left side of the index ({1,2,3}) and the sum of the right side of
#   the index ({3,2,1}) both equal 6.

# Let's look at another one.
# You are given the array {1,100,50,-51,1,1}:
# Your function will return the index 1, because at the 1st position of the array,
#  the sum of left side of the index ({1}) and the sum of the right side of the
#   index ({50,-51,1,1}) both equal 1.

# Last one:
# You are given the array {20,10,-80,10,10,15,35}
# At index 0 the left side is {}
# The right side is {10,-80,10,10,15,35}
# They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
# Index 0 is the place where the left side and right side are equal.

# Note: Please remember that in most programming/scripting languages the index
# of an array starts at 0.

# Input:
# An integer array of length 0 < arr < 1000. The numbers in the array can be any
#  integer positive or negative.

# Output:
# The lowest index N where the side to the left of N is equal to the side to the
#  right of N. If you do not find an index that fits these rules, then you will return -1.

# Note:
# If you are given an array with multiple answers, return the lowest correct index.
=begin
PROBLEM
----------------
INPUT: An integer array
OUTPUT: Integer representing the lowest index where the sum of the side to the left of N == sum of the side to the right of N

RULES:
- Return -1 if not found
- Empty arrays = 0
- Return the lowest correct index if found many good answers

EXAMPLES
----------------
BEGIN: {1,2,3,4,3,2,1}
=> Index 0
  => left_side = 0
  => right_side = array[1..-1].sum = 2 + 3 + 4 + 3 + 2 + 1
  => left_side == right_side = false
=> Index 1
  => left_side = array[0..0].sum = 1
  => right_side = array[2..-1].sum = 3 + 4 + 3 + 2 + 1
  => left_side == right_side = false
=> Index 2
  => left_side = array[0..1].sum = 1 + 2
  => right_side = array[3..-1].sum = 4 + 3 + 2 + 1
  => left_side == right_side = false
=> Index 3
  => left_side = array[0..2].sum = 1 + 2 + 3
  => right_side = array[4..-1].sum = 3 + 2 + 1
  => left_side == right_side = true
END: 3

BEGIN: array = {1,100,50,-51,1,1}
=> Index 0
  => left_side = index == 0 ? 0 : array[0..index - 1]
  => right_side = index == arr.size - 1 ? 0 : array[0..index + 1]array[1..-1].sum = 100 + 50 - 51 + 1 + 1
  => left_side == right_side = false
=> Index 1
  => left_side = array[0..0].sum = 1
  => right_side = array[2..-1].sum = 50 - 51 + 1 + 1 = 1
  => left_side == right_side = true
END: 1

DATA STRUCTURES
----------------
BEGIN: array
=> array, boolean, integers, range
END: Integer

NOTES:

ALGORITHM
----------------

Each over the array with index


=end

# def find_even_index(arr)
#   arr.each_with_index do |e, i|
#     left_side = i == 0 ? 0 : arr[0..i - 1].sum
#     right_side = i == arr.size - 1 ? 0 : arr[i + 1..-1].sum
#     return i if left_side == right_side
#   end
#   -1
# end

def find_even_index(arr)
  total_sum = arr.sum
  left_sum = 0

  arr.each_with_index do |e, i|
    total_sum -= e
    return i if left_sum == total_sum
    left_sum += e
  end

  -1
end


p find_even_index([1,2,3,4,3,2,1]) # 3
p find_even_index([1,100,50,-51,1,1]) # 1
p find_even_index([1,2,3,4,5,6]) # -1
p find_even_index([20,10,30,10,10,15,35]) # 3
p find_even_index([20,10,-80,10,10,15,35]) # 0
p find_even_index([10,-80,10,10,15,35,20]) # 6
p find_even_index(Array(1..100)) # -1
p find_even_index([0,0,0,0,0]) # 0,"Should pick the first index if more cases are valid"
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) # 3
p find_even_index(Array(-100..-1)) # -1
