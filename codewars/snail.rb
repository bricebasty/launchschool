# Snail Sort
# Given an n x n array, return the array elements arranged from outermost
# elements to the middle element, traveling clockwise.

# array = [[1,2,3],
#          [4,5,6],
#          [7,8,9]]
# snail(array) #=> [1,2,3,6,9,8,7,4,5]
# For better understanding, please follow the numbers of the next array consecutively:

# array = [[1,2,3],
#          [8,9,4],
#          [7,6,5]]
# snail(array) #=> [1,2,3,4,5,6,7,8,9]
# This image will illustrate things more clearly:


# NOTE: The idea is not sort the elements from the lowest value to the highest;
# the idea is to traverse the 2-d array in a clockwise snailshell pattern.

# NOTE 2: The 0x0 (empty matrix) is represented as en empty array inside an array [[]].

=begin
PROBLEM
----------------
INPUT:
OUTPUT:

RULES:
-

EXAMPLES
----------------
BEGIN:[[1,2,3],[4,5,6],[7,8,9]]
=>
=>
END:[1, 2, 3, 6, 9, 8, 7, 4, 5]

BEGIN: [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12, 13, 14, 15], [16, 17, 18, 19, 20], [21, 22, 23, 24, 25]]
=>
=>
END: [1, 2, 3, 4, 5, 10, 15, 20, 25, 24, 23, 22, 21, 16, 11, 6, 7, 8, 9, 14, 19, 18, 17, 12, 13]

BEGIN: [[1, 2, 3, 4, 5, 6], [20, 21, 22, 23, 24, 7], [19, 32, 33, 34, 25, 8], [18, 31, 36, 35, 26, 9], [17, 30, 29, 28, 27, 10], [16, 15, 14, 13, 12, 11]]
=> 1ere array tout a la suite [0][0..-1]
=> 2e array, dernier element [1][-1]
=> 3e array, dernier element [2][-1]
=> 4e array, dernier element [3][-1]
=> 5e array, dernier element au premier [4][-1..0]
=> 4e array, 1er element [3][0]
=> 3e array, 1er element [2][0]
=> 2e array, 1er element au dernier element- 1 - [1][0..-2]
=> 3e array, dernier element - 1  - [2][-2]
=> 4e array dernier element -1 au premier element + 1 [3][-2..1]
=> 3e array premier element + 1 au dernier element - 2 - [2][1..-3]
=> 4e array dernier element -3 a premier element + 2 - [3][-4..+2]
END: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36]

#
#

#
#


DATA STRUCTURES
----------------
BEGIN:
=>
END:

NOTES:

ALGORITHM
----------------

=end
