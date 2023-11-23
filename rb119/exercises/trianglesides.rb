# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be
# greater than the length of the longest side, and all sides must have lengths
# greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments,
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending
# on whether the triangle is equilateral, isosceles, scalene, or invalid.

=begin
09:42

PROBLEM
---

INPUT: 3 integers representing the sides of a triangle
OUTPUT: symbol of what is the triangle
RULES:
- Valid triangles:
  - All sides > 0
  - sum of two shortest sides > longest side

EXAMPLES
---

INPUT:
=>
OUTPUT:

DATA STRUCTURES
---

INPUT:
=>
OUTPUT:

ALGORITHM
---

WHAT

HOW
=end
triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid
