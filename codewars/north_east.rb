# Once upon a time, on a way through the old wild mountainous west,…
# … a man was given directions to go from one point to another. The directions were "NORTH", "SOUTH", "WEST", "EAST". Clearly "NORTH" and "SOUTH" are opposite, "WEST" and "EAST" too.

# Going to one direction and coming back the opposite direction right away is a needless effort. Since this is the wild west, with dreadful weather and not much water, it's important to save yourself some energy, otherwise you might die of thirst!

# How I crossed a mountainous desert the smart way.
# The directions given to the man are, for example, the following (depending on the language):

# ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"].
# or
# { "NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST" };
# or
# [North, South, South, East, West, North, West]
# You can immediately see that going "NORTH" and immediately "SOUTH" is not reasonable, better stay to the same place! So the task is to give to the man a simplified version of the plan. A better plan in this case is simply:

# ["WEST"]
# or
# { "WEST" }
# or
# [West]
# Other examples:
# In ["NORTH", "SOUTH", "EAST", "WEST"], the direction "NORTH" + "SOUTH" is going north and coming back right away.

# The path becomes ["EAST", "WEST"], now "EAST" and "WEST" annihilate each other, therefore, the final result is [] (nil in Clojure).

# In ["NORTH", "EAST", "WEST", "SOUTH", "WEST", "WEST"], "NORTH" and "SOUTH" are not directly opposite but they become directly opposite after the reduction of "EAST" and "WEST" so the whole path is reducible to ["WEST", "WEST"].

# Task
# Write a function dirReduc which will take an array of strings and returns an array of strings with the needless directions removed (W<->E or S<->N side by side).

# The Haskell version takes a list of directions with data Direction = North | East | West | South.
# The Clojure version returns nil when the path is reduced to nothing.
# The Rust version takes a slice of enum Direction {North, East, West, South}.
# See more examples in "Sample Tests:"
# Notes
# Not all paths can be made simpler. The path ["NORTH", "WEST", "SOUTH", "EAST"] is not reducible. "NORTH" and "WEST", "WEST" and "SOUTH", "SOUTH" and "EAST" are not directly opposite of each other and can't become such. Hence the result path is itself : ["NORTH", "WEST", "SOUTH", "EAST"].
# if you want to translate, please ask before translating.
=begin
PROBLEM
----------------
INPUT:
OUTPUT:

RULES:
-

EXAMPLES
----------------
BEGIN:["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]
=> NORTH : 1
=> NORTH : 1, SOUTH: 1
=> NORTH: 1, SOUTH: 2
=> NORTH : 1, SOUTH: 2, EAST: 1
=> NORTH : 1, SOUTH: 2, EAST: 1, WEST: 1
=> NORTH : 2, SOUTH: 2, EAST: 1, WEST: 1
=> NORTH : 2, SOUTH: 2, EAST: 1, WEST: 2
=> 2 - 2 = 0
END:["WEST"]

BEGIN:["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST", "NORTH"]
=> NORTH : 1
=> NORTH : 1, SOUTH: 1
=> NORTH: 1, SOUTH: 2
=> NORTH : 1, SOUTH: 2, EAST: 1
=> NORTH : 1, SOUTH: 2, EAST: 1, WEST: 1
=> NORTH : 2, SOUTH: 2, EAST: 1, WEST: 1
=> NORTH : 3, SOUTH: 2, EAST: 1, WEST: 2
=> 3 - 2 = 1
=> 1 time NORTH
END:["WEST"]

BEGIN:["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST", "SOUTH"]
=> NORTH : 1
=> NORTH : 1, SOUTH: 1
=> NORTH: 1, SOUTH: 2
=> NORTH : 1, SOUTH: 2, EAST: 1
=> NORTH : 1, SOUTH: 2, EAST: 1, WEST: 1
=> NORTH : 2, SOUTH: 2, EAST: 1, WEST: 1
=> NORTH : 2, SOUTH: 3, EAST: 1, WEST: 2
=> 2 - 3 = -1
=> 1 time SOUTH
END:["WEST"]

NORTH COUNT - SOUTH COUNT = 1

BEGIN: ["NORTH", "WEST", "SOUTH", "EAST"]
=> NORTH: 1
END: ["NORTH", "WEST", "SOUTH", "EAST"]

DATA STRUCTURES
----------------
BEGIN:
=>
END:

NOTES:

ALGORITHM
----------------
For each element in the array
Count the number of same elements and return it in a hash
Take the value of "NORTH" key and subtract value of "SOUTH" to it
if its positive put it an array number * elements NORTH string
if its negative put in an array number * elements SOUTH string
if its 0 do nothing
Take the value of "WEST" key and subtract value of "EAST" to it
if its positive put it an array number * elements WEST string
if its negative put in an array number * elements EAST string
if its 0 do nothing

=end


def dirReduc(arr)
  p arr
  p hash = arr.each_with_object({}) { |e, h| h[e].nil? ? h[e] = 1 : h[e] += 1 }
  new_arr = []

  p number_of_y = hash["NORTH"] - hash["SOUTH"]
  case
  when number_of_y.negative? then new_arr << Array.new(number_of_y, "NORTH")
  when number_of_y.positive? then new_arr << Array.new(number_of_y.abs, "SOUTH")
  end

  p number_of_x = hash["WEST"] - hash["EAST"]
  case
  when number_of_x.negative? then new_arr << Array.new(number_of_x, "EAST")
  when number_of_x.positive? then new_arr << Array.new(number_of_x.abs, "WEST")
  end

  new_arr.flatten
end

p dirReduc(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"])
p dirReduc(["NORTH", "WEST", "SOUTH", "EAST"])
