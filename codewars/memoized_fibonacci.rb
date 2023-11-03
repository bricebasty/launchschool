def square(n, memo = {})
  puts "Calculating" if memo[n].nil?
  memo[n] ||= n * n
end

# Usage
memo = {}

puts square(5, memo)  # Will print "Calculating square of 5..." and then return 25
puts square(5, memo)  # Will immediately return 25 without printing, because it's using the cached value
puts square(5, memo)  # Will immediately return 25 without printing, because it's using the cached value
puts square(5, memo)  # Will immediately return 25 without printing, because it's using the cached value
puts square(9, memo)  # Will print "Calculating square of 9..." and then return 81
puts square(9, memo)  # Will immediately return 81 without printing, because it's using the cached value


=begin
PROBLEM
----------------
INPUT: 12
OUTPUT: 144

RULES:
- Begin from 1

EXAMPLES
----------------
BEGIN: 12
=> [0, 1]
=> [0, 1] << 0 + 1 -> [0, 1, 1]
=> [0, 1, 1] << 1 + 1
=> [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
END: 144

DATA STRUCTURES
----------------
BEGIN: Integer
=> Array
END: Integer

NOTES:

ALGORITHM
----------------



=end
