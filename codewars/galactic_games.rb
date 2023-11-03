# The galactic games have begun!
# It's the galactic games! Beings of all worlds come together to compete in
# several interesting sports, like nroogring, fredling and buzzing (the beefolks
# love the last one). However, there's also the traditional marathon run.

# Unfortunately, there have been cheaters in the last years, and the committee
# decided to place sensors on the track. Committees being committees, they've
# come up with the following rule:

# A sensor should be placed every 3 and 5 meters from the start, e.g. at 3m, 5m,
# 6m, 9m, 10m, 12m, 15m, 18m….

# Since you're responsible for the track, you need to buy those sensors.
# Even worse, you don't know how long the track will be! And since there might
# be more than a single track, and you can't be bothered to do all of this by
# hand, you decide to write a program instead.
# end

# Task
# Return the sum of the multiples of 3 and 5 below a number. Being the galactic
# games, the tracks can get rather large, so your solution should work for really
# large numbers (greater than 1,000,000).

# Examples
# solution(10) # => 23 = 3 + 5 + 6 + 9
# solution(20) # => 78 = 3 + 5 + 6 + 9 + 10 + 12 + 15 + 18
#
=begin
PROBLEM
----------------
INPUT: Integer
OUTPUT: Integer

RULES:
- Every 3 and 5 meters add

EXAMPLES
----------------
BEGIN: 10
=> 0 + 3 = 3
=> 3 + 5 = 8
=> 8 + 6 = 14
=> 14 + 9 = 23

3x1 + 3x2 + 3x3 + 5x1

=> 3x1 = 3 < 10 -> true
=> 3x2 = 6 < 10 -> true
=> 3x3 = 9 < 10 -> true
=> 5x1 = 5 < 10 -> true
END: 23

DATA STRUCTURES
----------------
BEGIN: Integer
INBETWEEN: Array of Integer exponentiation
END: Integer

Upto

ALGORITHM
----------------

initialize an iterator
initialize a sum variable
if 3 * i < number
  add it to the sum
if 5 * i < number
  add it to the sum


=end

def solution(number)
  i = 1
  sum = 0
  loop do
    multiple = 3 * i
    multiple2 = 5 * i

    break if multiple >= number && multiple2 >= number

    sum += multiple if multiple < number
    sum += multiple2 if multiple2 < number && multiple2 % 3 != 0

    i += 1
  end
end

solution(1000)
