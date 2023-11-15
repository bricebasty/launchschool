# Write a method that displays a 4-pointed diamond in an n x n grid, where n is
# an odd integer that is supplied as an argument to the method. You may assume
# that the argument will always be an odd integer.

#09:38
=begin
PROBLEM

IN: Odd integer
OUT: diamond composed of * in console
RULES:
- No spec on what to return if integer is even

EXAMPLES:

IN: 3
=>' ''*' iteration = 0
=>'***' iteration = 1
=>' ''*' iteration = 2 1 space 1 asterisk
OUT:
 *
***
 *

IN: 5
=>"  "'*' 2 spaces
=>" "'***' 1 space
=>'''*****' 0 space 5 astersks - iteration 2 (3)
=>' ''***' 1 space 3 asterisks - iteration 3 (4)
- il faut arriver à 1 avec 3, 9, 9/2
4 - 3
4 - 4

-  /  - 2 = 3
=>'  ''*' 2 space 1 asterisk - iteration 4 (5)
- il faut arriver à 2 avec 4, 9, 9/2
- /  - 2 = 1
OUT:

IN: 9
=> '    ''*' - 4 spaces - 1 * - iteration = 0 -> 4 - 0
=> '   ''***' - 3 spaces - 3 * - iteration = 1 -> 4 - 1
=> '  ''*****' - 2 spaces - 5 *
=> ' ''*******' - 1 space - 7 *
=> '''*********' - 0 space - 9 * iteration = 4
=> ' ''*******' - 1 space - 7 * iteration = 5 (6e) 9
=> '  ''*****'- 2 spaces - 5 * - iteration = 6 (7e)
=> '   ''***' - 3 spaces - 3 * - iteration = 7 (8e)
=> '    ''*' - 4 spaces - 1 * - iteration = 8 (9e)

4


OUT:
    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

DATA STRUCT

ALGO

HIGH LEVEL:

We need to have spaces variable to get the number of spaces
We need to have a variable which will hold the number of asterisks

For the number we have been given, we want to do this number of times
  if the iteration is less than the number divided by float 2.0
    outputs the spaces in descending order and asterisk in ascending by 2
  else
    then outputs the spaces in ascending order and asterisks in descending by 2

LOW LEVEL

Initialize `spaces` variable to 0
Initialize `asterisks` variable to 0

Do n times


=end

def diamond(integer)
  array = []
  index_for_else = 1
  integer.times do |iteration|
    if iteration < integer / 2.0
      array << (" " * ((integer / 2) - iteration)) + ("*" * ((iteration * 2) + 1))
      puts array[iteration]
    else
      puts array.reverse[index_for_else]
      index_for_else += 1
    end
  end
end

diamond(1)
diamond(3)
diamond(9)
