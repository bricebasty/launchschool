# Task
# You will be given an array of numbers. You have to sort the odd numbers in
# ascending order while leaving the even numbers at their original positions.

# Examples
# [7, 1]  =>  [1, 7]
# [5, 8, 6, 3, 4]  =>  [3, 8, 6, 5, 4]
# [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]  =>  [1, 8, 3, 6, 5, 4, 7, 2, 9, 0]
#
=begin
PROBLEM
----------------
INPUT:
OUTPUT:

RULES:
-

EXAMPLES
----------------
BEGIN: [5, 8, 6, 3, 4]
=> {8: 1, 6: 2, 4: 4}
=> [5, 3]
=> [3, 5]
END: [3, 8, 6, 5, 4]

DATA STRUCTURES
----------------
BEGIN:
=>
END:

NOTES:

ALGORITHM
----------------
Pour chaque `int` dans `array` avec un objet {} `hash` et avec index `index`
Ajouter à ce hash  la key `int` avec value `index` si le nombre est pair
Ajouter le count de ce
Storer dans `hash`

Supprimer de `array` les nombres pairs
Pour chaque élément dans `hash`, ajouter à `array` à l'index de la value la key

=end

def sort_array(source_array)
  arr = source_array.each_with_object([]).with_index do |(e, arr), index|
    arr[index] = e if e.even?
  end
  source_array.delete_if { |n| n.even? }.sort!
  arr.each_with_index { |e, i| source_array.insert(i, e) unless e.nil? }
  p source_array
end

p sort_array([5, 3, 2, 8, 1, 4, 11])
p sort_array([-47, -47, -45, -37, -33, -31, -25, -25, -14, -25, -48, -21, -11, -9, -7, -5, 50, 18, -1, -26, 1, -26, -42, 22, 18, -32, 32, 3, 24, 12, 3, 3, -44, 36, 21, -30, 21, 24, 50, -4, 35, 16, 34, 4, 20, -24, 45, 49, -8, 49])

[-8, -49, -49, -38, 46, -47, 34, 12, 16, -44, -33, -34, 50, -27, 44, -21, -21, -17, -15, -13, -12, -11, -26, -12, -9, -36, -5, 5, 7, 21, 48, -2, 24, -42, 23, -4, 33, 28, 0, 43, 28]
[-8, -49, -49, -38, 46, -47, 34, 12, 16, -44, -33, -34, 50, -27, 44, -21, -21, -17, -15, -13, -11, -9, -26, -5, -12, -36, -12, 5, 7, 21, 48, -2, 24, -42, 23, -4, 33, 43, 0, 28, 28]
