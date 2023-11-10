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
INPUT: [-2, 1, -3, 4, -1, 2, 1, -5, 4]
=> -2 -> non
=> 1 -> oui -> 1 - 3 -> non
=> -3 -> non
=> 4 -> oui -> 4 - 1 -> 3 -> oui -> 3 + 2 -> 5 -> oui -> 5 + 1 -> 6 -> oui -> 6 - 5 -> 1 -> oui -> 1 + 4 -> 5 -> oui
OUTPUT: 6

INPUT: [-10, 20, -21, 30]
=> -10 non
=> 20 - 21 -> -1 + 30 = 40
OUTPUT:

DATA STRUCTURES
----------------
INPUT:
=>
OUTPUT:

NOTES:

ALGORITHM
----------------

Iterate through arr
  If the element in the array is negative
    Go to the next iteration
  Else
    Take the current element and add it to the next element
    Push this result to another array
    If this result added to the next element is positive
      Add this new result to the array
        If this new result added to the next element is positive
          Add this new result to the array
    Else
      Go to next iteration

SET sum_array = []

iterator = 0

WHILE iterator <= length of array
  IF current element < 0
    NEXT
  ELSE
    SET current elemenet = element in arr at index iterator
    SET result = current element
    SET next element = array at index
    SET sub_array = array from current element to last element
    SET iterator2 = 0
    WHILE result > 0 and iterator2 <= length of sub_array
      result = current element + next element
      add result to sum_array
      iterator2 += 1

  iterator += 1

TAKE THE MAX FROM sum_array

=end
def max_sequence(arr)
  return 0 if arr.all?(&:negative?) || arr.empty?
  return arr[0] if arr.size == 1
  sum_array = []
  iterator = 0
  while iterator <= arr.size - 1
    current_element = arr[iterator]
    iterator += 1 if current_element.negative?
    next if current_element.negative?

    result = current_element
    next_element = arr[iterator + 1]
    sub_array = arr[iterator..-1]
    iterator2 = 0

    while !next_element.nil? && result > 0
      sum_array << result if result.positive?

      result += next_element
      iterator2 += 1
      next_element = sub_array[iterator2 + 1]
    end

  iterator += 1
  end
  sum_array.max
end

# puts 'Test result is ' + (max_sequence([]) == 0).to_s.upcase
# p max_sequence([]) # 0

puts 'Test result is ' + (max_sequence([4, -1, 2, 1, -5, 4]) == 6).to_s.upcase
p max_sequence([4, -1, 2, 1, -5, 4]) # 6

puts 'Test result is ' + (max_sequence([11]) == 11).to_s.upcase
p max_sequence([11]) # 11

puts 'Test result is ' + (max_sequence([-32]) == 0).to_s.upcase
p max_sequence([-32]) # 0

puts 'Test result is ' + (max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12).to_s.upcase
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) # 12
