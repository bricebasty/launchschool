# Some numbers have funny properties. For example:

# 89 --> 8¹ + 9² = 89 * 1

# 695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2
#  6^1 +

# 46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

# Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p
# we want to find a positive integer k, if it exists, such that the sum of the digits of n taken to the
# successive powers of p is equal to k * n.
#
# In other words:

# Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k

# If it is the case we will return k, if not return -1.

# Note: n and p will always be given as strictly positive integers.

# dig_pow(89, 1) should return 1 since 8¹ + 9² = 89 = 89 * 1
# dig_pow(92, 1) should return -1 since there is no k such as 9¹ + 2² equals 92 * k
# dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2
# dig_pow(46288, 3) should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51
=begin
PROBLEM
----------------
INPUT: Integer, integer
OUTPUT: Integer if it exists of the multiplied input number by it

RULES:
- Return -1 if no integer is found

EXAMPLES
----------------
BEGIN: 89, 1
=> 8**1 + 9**2
=> 8 + 81
=> 89
END:

BEGIN: 92, 1
=> 9**1 + 2**2
=> 13
=> 13.divmod(9)
=> [1, 4]
END: -1

BEGIN: 695, 2
=> 6**2 + 9**3 + 5**4
=> 1390
=> 1390.divmod(695)
=> [2, 0]
END: 2

BEGIN: 89, 1
=> 8**1 + 9**2
=> 89
=> 89.divmod(89)
=> [1, 0]
END: 1

DATA STRUCTURES
----------------
BEGIN:
INBETWEEN:
END:


ALGORITHM
----------------

For each digits in n, return an array with the digits powered to p += 1
Sum the array
if the last element of the sum divmodded is 0, return the first element, else return -1

=end
def dig_pow(n, p)
  divmod = n.digits.reverse.map.with_index { |e, i| e**(p + i) }.sum.divmod(n)
  divmod[1] == 0 ? divmod[0] : -1
end

p dig_pow(89, 1)
p dig_pow(46288, 3)
