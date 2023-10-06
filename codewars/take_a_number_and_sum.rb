# The number
# 89 is the first integer with more than one digit that fulfills the property
# partially introduced in the title of this kata. What's the use of saying "Eureka"?
# Because this sum gives the same number:
# 89 = 8^1 + 9^2

# The next number in having this property is
# 135:

# See this property again:
# 135 = 1^1 + 3^2 + 5^3

# Task
#
# We need a function to collect these numbers, that may receive two integers a,
# b that defines the range [a,b] (inclusive) and outputs a list of the sorted
# numbers in the range that fulfills the property described above.

# Examples
# Let's see some cases (input -> output):

# 1, 10  --> [1, 2, 3, 4, 5, 6, 7, 8, 9]
# 1, 100 --> [1, 2, 3, 4, 5, 6, 7, 8, 9, 89]
#
# If there are no numbers of this kind in the range [a,b] the function should
# output an empty list.

# 90, 100 --> []
# Enjoy it!!

=begin
PROBLEM
----------------
INPUT:
OUTPUT:

RULES:
-

EXAMPLES
----------------
BEGIN: 1, 10
=>
=>
END: [1, 2, 3, 4, 5, 6, 7, 8, 9]

BEGIN: 1, 100
=> (1..100)
=> 1 -> 1^1 -> TRUE
=> [1]
=> 89 -> -> [8, 9] -> 8^1 + 9^2 = 8 + 81 = 89 == 89 -> TRUE
END: [1, 2, 3, 4, 5, 6, 7, 8, 9, 89]

DATA STRUCTURES
----------------
BEGIN:
=>
END:

NOTES:

ALGORITHM
----------------

Create a range `(a..b)`
Select in this range every `e` element which is eureka
- Take the digits of `e` into an array
- Sum this array with index by the exponentation of element by index + 1
- Check if this sum == `e`

=end

def sum_dig_pow(a, b)
  (a..b).select { |e| e == e.digits.reverse.each_with_index.sum { |d, i| d**(i + 1) } }
end

p sum_dig_pow(1, 10) # ([1, 2, 3, 4, 5, 6, 7, 8, 9])
p sum_dig_pow(1, 100) # ([1, 2, 3, 4, 5, 6, 7, 8, 9, 89])
p sum_dig_pow(10, 100) # ( [89])
p sum_dig_pow(90, 100) # ([])
p sum_dig_pow(90, 150) # ([135])
p sum_dig_pow(50, 150) # ([89, 135])
p sum_dig_pow(10, 150) # ([89, 135])
