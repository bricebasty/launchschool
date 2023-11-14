# 1000 Lights
# You have a bank of switches before you, numbered from 1 to n. Each switch is
# connected to exactly one light that is initially off. You walk down the row of
# switches and toggle every one of them. You go back to the beginning, and on
# this second pass, you toggle switches 2, 4, 6, and so on. On the third pass,
# you go back again to the beginning and toggle switches 3, 6, 9, and so on.
# You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and
# returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

=begin
10:44 11:14

PROBLEM
---
IN: number of lights/rounds integer
OUT: Array of integers, which represent the on light switches
RULES:
- Number of lights is also number of repetitions
- Switch on the last number in the round

EXAMPLES
---
IN: 5
=> Round 0 : 1=> false 2 3 4 5
=> Round 1 : 1=> true [2] [3] [4] [5]
=> Round 2 : [1] 2 [3] 4 [5]
=> Round 3 : [1] 2 3 4 [5]
=> Round 4 : [1] 2 3 [4] [5]
=> ROund 5 : [1] 2 3 [4] 5
OUT: [1, 4]

DATA
---
IN: Integer
=> Hash
OUT: Array

ALGO
---
WHAT ?

Create a hash up every key up to the input integer and values are on off
Do integer times
  Go through each of the keys
    We go to the next iteration if the index + 1 we're at is not a multiple of the iteration + 1
    we reverse the boolean in the value

Select in the hash the values which are true

HOW ?
Take a range from 1 to input integer and each with object hash and element light
- in hash with key light and value false
Create an empty hash
Do lights times
  For each key in status of lights
    go to the next iteration if the key modulo iterator + 1 is equal to 0
    reverse its value

=end


def count_lights(lights)
  status_of_lights = (1..lights).map { |light| [light, false] }

  lights.times do |iterator|
    status_of_lights.map! { |(light, bool)| light % (iterator + 1) == 0 ? [light, !bool] : [light, bool]  }
  end

  status_of_lights.select { |(_, bool)| bool }.flatten.delete_if { |e| e == true }
end

p count_lights(10)
