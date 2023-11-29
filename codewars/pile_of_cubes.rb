# Your task is to construct a building which will be a pile of n cubes. The cube at the bottom will have a volume of

#  , the cube above will have volume of
# nd so on until the top which will have a volume of


# You are given the total volume m of the building. Being given m can you find the number n of cubes you will have to build?

# The parameter of the function findNb (find_nb, find-nb, findNb, ...) will be
# an integer m and you have to return the integer n such as
# n**3 + (n - 1)**3 + (n - 2)**3 ... + 1**3 = m if such a n exists or -1 if there is no such n.

=begin
PROBLEM
----------------
INPUT: Integer representing the Volume m of the building
OUTPUT: Number of cubes needed to build the building

RULES:
-

EXAMPLES
----------------
INPUT: 100
=> V100 = 10
=> 10
=> 1 (+ 2)
=> 3 (+ 3)
=> 6 (+ 4)
=> 10
=> 1 + 2 + 3 + 4
OUTPUT: 4

INPUT: 36
=> V36 = 6
=> 6
=> 3 + 2 + 1
OUTPUT: 3

INPUT: 9
=> V9 = 3
=> 3
=> 2 + 1
OUTPUT: 2

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

def find_nb(m)
  square_root = Math.sqrt(m)
  return -1 unless square_root == square_root.to_i
  result = 1
  n = 1
  until result == square_root
    n += 1
    result += n
  end
  n
end

puts 'Test result is ' + (find_nb(4183059834009) == 2022).to_s.upcase
p find_nb(4183059834009) # 2022

puts 'Test result is ' + (find_nb(24723578342962) == -1).to_s.upcase
p find_nb(24723578342962) # -1

puts 'Test result is ' + (find_nb(135440716410000) == 4824).to_s.upcase
p find_nb(135440716410000) # 4824

puts 'Test result is ' + (find_nb(40539911473216) == 3568).to_s.upcase
p find_nb(40539911473216) # 3568
