# Your task is to construct a building which will be a pile of n cubes. The cube at the bottom will have a volume of

#  , the cube above will have volume of
# nd so on until the top which will have a volume of


# You are given the total volume m of the building. Being given m can you find the number n of cubes you will have to build?

# The parameter of the function findNb (find_nb, find-nb, findNb, ...) will be an integer m and you have to return the integer n such as

# m if such a n exists or -1 if there is no such n.

=begin
PROBLEM
----------------
INPUT: Integer representing the Volume m of the building
OUTPUT: Number of cubes needed to build the building

RULES:
-

EXAMPLES
----------------
INPUT:
=>
=>
OUTPUT:

DATA STRUCTURES
----------------
INPUT:
=>
OUTPUT:

ALGORITHM
----------------

NOTES:

HIGH-LEVEL:

LOW-LEVEL:

=end


puts 'Test result is ' + (find_nb(4183059834009) == 2022).to_s.upcase
p find_nb(4183059834009) # 2022

puts 'Test result is ' + (find_nb(24723578342962) == -1).to_s.upcase
p find_nb(24723578342962) # -1

puts 'Test result is ' + (find_nb(135440716410000) == 4824).to_s.upcase
p find_nb(135440716410000) # 4824

puts 'Test result is ' + (find_nb(40539911473216) == 3568).to_s.upcase
p find_nb(40539911473216) # 3568
