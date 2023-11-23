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
09:42 09:55

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

INPUT: 3, 3, 3
=> [3, 3, 3] -> all equal ? -> yes
OUTPUT: :equilateral

DATA STRUCTURES
---

INPUT:
=>
OUTPUT:

ALGORITHM
---

WHAT

Store the arguments in an array and sort them
Return :invalid if any side isnt greater than 0 or the sum of first 2 in the array < third
Uniq the array
If the uniq array is 1 character long
return :equilateral
If the uniq array size is 2
return isosceles
If the uniq array size is 3
return scalene

HOW
=end

def triangle(side1, side2, side3)
  all_sides = [side1, side2, side3].sort
  return :invalid if all_sides.any?(&:zero?) || all_sides[0..1].sum < all_sides[2]
  case all_sides.uniq.size
  when 1
    :equilateral
  when 2
    :isosceles
  when 3
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
