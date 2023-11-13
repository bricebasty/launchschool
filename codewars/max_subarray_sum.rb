# The maximum sum subarray problem consists in finding the maximum sum of a
# contiguous subsequence in an array or list of integers:

# maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# -- should be 6: [4, -1, 2, 1]
# Easy case is when the list is made up of only positive numbers and the maximum
# sum is the sum of the whole array. If the list is made up of only negative
# numbers, return 0 instead.

# Empty list is considered to have zero greatest sum. Note that the empty list
# or array is also a valid sublist/subarray.
=begin
PROBLEM
----------------
INPUT: Array of integers
OUTPUT: Highest sum of successive numbers in array

RULES:
- Return 0 if array contains only negative or empty

EXAMPLES
----------------
INPUT: [4, -1, 2, 1, -5, 4]

=> [4] index 0 1
=> [4, -1] index 0 2
=> [4, -1, 2] index 0 3
=> [4, -1, 2, 1] index 0 4
=> [4, -1, 2, 1, -5] index 0 5
=> [4, -1, 2, 1, -5, 4] index 0 6

=> [-1] 1 1
=> [-1, 2] 1 2
=> [-1, 2, 1] 1 3
=> [-1, 2, 1, -5] 1 4
=> [-1, 2, 1, -5, 4] 1 5

=> [2] 2 1
=> [2, 1] 2 2
=> [2, 1, -5] 2 3
=> [2, 1, -5, 4] 2 4

=> [1] 3 1
=> [1, -5] 3 2
=> [1, -5, 4] 3 3

=> [-5] 4 1
=> [-5, 4] 4 2

=> [4]
OUTPUT: 6

INPUT: [-10, 20, -21, 30]
=>
OUTPUT:

DATA STRUCTURES
----------------
INPUT:
=>
OUTPUT:

NOTES:

ALGORITHM
----------------
HIGH-LEVEL:
Extract all the consecutive subarrays possible
Remove duplicates
Sum each of these arrays
Take the max number in the resulting array

LOW-LEVEL:
Initialize an empty array `all_consecutive_numbers`
For each index in the original array with its index called start_index
  Create a max_size which will be the original array size minus the start_index
  Each From 1 to max_size parameter is wanted_size
    next if the all_consecutive_numbers includes value of original array at index start_index for size wanted_size
    push to all_consecutive_numbers the array at index start_index for size wanted_size

map all arrays in all_consecutives_numbers to their sum, and take the max of it
=end

def max_sequence(array)
  return 0 if array.nil? || array.all?(&:negative?)

  all_consecutive_numbers = []
  array.each_index do |start_index|
    max_size = array.size - start_index
    (1..max_size).each do |wanted_size|
      next if all_consecutive_numbers.include?(array[start_index, wanted_size])
      all_consecutive_numbers << array[start_index, wanted_size]
    end
  end
  all_consecutive_numbers.map(&:sum).max
end

puts 'Test result is ' + (max_sequence([]) == 0).to_s.upcase
p max_sequence([]) # 0

puts 'Test result is ' + (max_sequence([4, -1, 2, 1, -5, 4]) == 6).to_s.upcase
p max_sequence([4, -1, 2, 1, -5, 4]) # 6

puts 'Test result is ' + (max_sequence([11]) == 11).to_s.upcase
p max_sequence([11]) # 11

puts 'Test result is ' + (max_sequence([-32]) == 0).to_s.upcase
p max_sequence([-32]) # 0

puts 'Test result is ' + (max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12).to_s.upcase
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) # 12
