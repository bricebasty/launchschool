# Sum Square - Square Sum
# Write a method that computes the difference between the square of the sum of the
# first n positive integers and the sum of the squares of the first n positive integers.

=begin
PROBLEM
----------------
INPUT: Integer
OUTPUT: Difference between
- Square of the sum of the first n positive integers
- Sum of the squares of the first n positive integers

RULES:
-

EXAMPLES
----------------
INPUT:  3
=> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
OUTPUT: 22

DATA STRUCTURES
----------------
INPUT:
=>
OUTPUT:

ALGORITHM
----------------

NOTES:

HIGH-LEVEL:
Take each number from the 1 to the integer and sum them
Then square the result
Substract to the result
  Each number from the 1 to the integer squared
  Sum each of these squared integers


LOW-LEVEL:



=end

def sum_square_difference(integer)
  (1..integer).send(:+)**2
end


sum_square_difference(3) == 22 # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150
