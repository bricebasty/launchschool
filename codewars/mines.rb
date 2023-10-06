# Input
# [ [1, 0], [0, 0] ]
# Output
# [0, 0]

# Input
# [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]
# Output
# [0, 0]

# Input
# [ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]
# Output
# [2, 2]

# return an array with
# first element =  index of the array which has 1 in it
#
# inside field i want to check which array has 1 in it
# second element = inside this seleted array index of 1

#

def mineLocation field
  [index = field.find_index { |array| array.include?(1) }, field[index].find_index(1)]
end

p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ])
