# You are given an array (which will have a length of at least 3, but could be
# very large) containing integers. The array is either entirely comprised of odd
# integers or entirely comprised of even integers except for a single integer N.
# Write a method that takes the array as an argument and returns this "outlier"N

# Examples
# [2, 4, 0, 100, 4, 11, 2602, 36]
# Should return: 11 (the only odd number)

# [160, 3, 1719, 19, 11, 13, -21]
# Should return: 160 (the only even number)

# Check the first 2 elements in an array to determine if it's odd or even
#   if one is odd and one is even, check the third
# if it's odd, select in the array the even one
# if it's even, select in the array the odd one

def find_outlier(integers)
  integers.map(&:even?).one?(false) ? integers.select(&:odd?).join.to_i : integers.select(&:even?).join.to_i
end

p find_outlier([17, 6, 8, 10, 6, 12, 24, 36])
