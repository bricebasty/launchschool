# Description
# Given an array X of positive integers, its elements are to be transformed by
# running the following operation on them as many times as required:

# if X[i] > X[j] then X[i] = X[i] - X[j]

# When no more transformations are possible, return its sum ("smallest possible sum").

# For instance, the successive transformation of the elements of input X = [6, 9, 21] is detailed below:
# X = [6, 9, 21] # -> X_1[2] = X[2] - X[1] = 21 - 9
# X_1 = [6, 9, 12] # -> X_2[2] = X_1[2] - X_1[0] = 12 - 6
# X_2 = [6, 9, 6]  # -> X_3[1] = X_2[1] - X_2[0] = 9 - 6
# X_3 = [6, 3, 6]  # -> X_4[2] = X_3[2] - X_3[1] = 6 - 3
# X_4 = [6, 3, 3]  # -> X_5[1] = X_4[0] - X_4[1] = 6 - 3
# X_5 = [3, 3, 3]  # -> 9
# The returning output is the sum of the final transformation (here 9).

# Example
# [6, 9, 21]) #-> 9
# Solution steps:
# [6, 9, 12] #-> X[2] = 21 - 9
# [6, 9, 6] #-> X[2] = 12 - 6
# [6, 3, 6] #-> X[1] = 9 - 6
# [6, 3, 3] #-> X[2] = 6 - 3
# [3, 3, 3] #-> X[1] = 6 - 3
# Additional notes:
# There are performance tests consisted of very big numbers and arrays of size at least 30000.
# Please write an efficient algorithm to prevent timeout.

# return smallest possible sum of all numbers in Array
=begin
PROBLEM
----------------
INPUT: An array of X integers
OUTPUT: Sum of the final array transformed

RULES:
- if array[i] > array[j] then array[i] = array[i] - array[j]

EXAMPLES
----------------
BEGIN: [1, 21, 55]
=> 55 - 21 = 34
-> [1, 21, 34]
=> 34 - 21 = 13
-> [1, 21, 13]
=> 21 - 13 = 8
-> [1, 8, 13]
=> 13 - 8 = 5
-> [1, 8, 5]
=> 8 - 5 = 3
-> [1, 3, 5]
=> 5 - 3 = 2
-> [1, 3, 2]
=> 3 - 2 = 1
-> [1, 1, 2]
=> 2 - 1 = 1
-> [1, 1, 1]
END: 3

[3, 13, 23, 7, 83]
5

[4, 16, 24]
12

[30, 12]
12

BEGIN: [60, 12, 96, 48, 60, 24, 72, 36, 72, 72, 48]
=>
END: 132

[71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71]
923

[11, 22]
22

[9]
9

DATA STRUCTURES
----------------
BEGIN: ARRAY
INBETWEEN: ARRAY AND INTEGER
END: INTEGER

ALGORITHM
----------------
- Until all elements in array the same
- Sort the array
- Take the max number and subtract the second max number to it

=end
# def solution(array)
#   c = 0
#   until c == 1000 || array.all? { |e| e == array[0] }
#     array.sort!
#     different_index = -2
#     while array[different_index] == array[-1]
#       different_index -= 1
#     end
#     array[-1] = array[-1] - array[different_index]
#     c += 1
#   end
#   p array.sum
# end

def solution(array)
  array.reduce(&:gcd) * array.size
end

solution([1, 21, 55]) # 3)
solution([3, 13, 23, 7, 83]) # 5)
solution([4, 16, 24]) # 12)
solution([30, 12]) # 12)
solution([60, 12, 96, 48, 60, 24, 72, 36, 72, 72, 48]) # 132)
solution([71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71]) # 923)
solution([11, 22]) # 22)
solution([9]) # 9)
