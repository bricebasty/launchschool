def solve(string)
  all_substrings = []
  (0...string.size).each do |starting_index|
    max_size = string.size - starting_index
    (1..max_size).each do |current_size|
      all_substrings << string[starting_index, current_size]
    end
  end
  all_substrings.select { |element| element.to_i.odd? }.size
end

# creating pairs of elements from a given array
arr = [1, 2, 3, 4, 5, 6, 7, 8]
result = []

(0...arr.size).each do |i|
  (i+1...arr.size).each do |ii|
    result << [arr[i], arr[ii]]
  end
end

# creating substrings and adding to an array
str = 'hello there happy studies'
substrings = []

(0...str.size).each do |i|
  (i+1...str.size).each do |ii|
    substrings << str[i..ii]
  end
end

# can add the step method if we want to only modify elements at certain indices
# for example, if we wanted to grab every second index

string = "we only want every other word"
words = string.split
result = []

(1...words.size).step(2) do |i|
  result << words[i]
end

# Problem 1

# Order the elements of an existing array in reverse in a new array

array = [1, 2, 3, 4]
reversed_array = []

array.each { |num| reversed_array.unshift(num) }

p reversed_array

# Reverse the order of elements in an existing array

array = [1, 2, 3, 4]
length = array.size

for i in 0...(length/2)
  temp = array[i]
  array[i] = array[length-1-i]
  array[length-1-i] = temp
end

p array

# Problem 2

# Return all sub-strings

def substrings(arr)
  arr.chars.each_with_object([]).with_index do |(_, acc_arr), index|
    1.upto(arr.length - index) do |length|
      acc_arr << arr[index, length]
    end
  end
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
