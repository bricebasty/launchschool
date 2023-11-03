# Build Tower
# Build a pyramid-shaped tower, as an array/list of strings, given a positive
# integer number of floors. A tower block is represented with "*" character.

# For example, a tower with 3 floors looks like this:

# [
#   "  *  ",
#   " *** ",
#   "*****"
# ]
# And a tower with 6 floors looks like this:

# [
#   "     *     ",
#   "    ***    ",
#   "   *****   ",
#   "  *******  ",
#   " ********* ",
#   "***********"
# ]

=begin
PROBLEM
----------------
INPUT:
OUTPUT:

RULES:
-

EXAMPLES
----------------
BEGIN: 3
=> floor 1 = 2 s 1* 2s
=> floor 2 = 1s 3* 1s
=> floor 3 = 0s 5* 0s
END:
# [
#   "  *  ",
#   " *** ",
#   "*****"
# ]


BEGIN:
=> floor 1 = 5s + 1* + 5s
=> floor 2 = 4s + 3* + 4s
=> floor 3 = 3s + 5* + 3s
=> floor 4 = 2s + 7* + 2s
=> floor 5 = 1s + 9* + 1s
=> floor 6 = 0s + 11* + 0s
END:
# [
#   "     *     ",
#   "    ***    ",
#   "   *****   ",
#   "  *******  ",
#   " ********* ",
#   "***********"
# ]

DATA STRUCTURES
----------------
BEGIN:
=>
END:

NOTES:

ALGORITHM
----------------

pour chaque élement de n..floors à 1 map
e * " " +  + e * " "

=end

def towerBuilder(n)
  (n - 1).downto(0).map.with_index { |e, i| (' ' * e) + '*' * (i * 2 + 1) + (' ' * e) }
end

p towerBuilder(1) # => ['*'] - "1 floor"
p towerBuilder(2) # => [' * ', '***'] - "2 floors"
p towerBuilder(3) # => ['  *  ', ' *** ', '*****'] - "3 floors"
