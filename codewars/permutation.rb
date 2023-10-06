# In this kata, your task is to create all permutations of a non-empty input string
# and remove duplicates, if present.

# Create as many "shufflings" as you can!

# Examples:

# With input 'a':
# Your function should return: ['a']

# With input 'ab':
# Your function should return ['ab', 'ba']

# With input 'abc':
# Your function should return ['abc','acb','bac','bca','cab','cba']

# With input 'aabb':
# Your function should return ['aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa']
# Note: The order of the permutations doesn't matter.

# Good luck!
#

=begin
PROBLEM
----------------
INPUT: String
OUTPUT: Array of strings with all combinations of permutations possible, without duplicates

RULES:
-

EXAMPLES
----------------
BEGIN:'abc'
1 'abc', 'bac'
2 'abc', 'bac', 'bca'
3 'abc', 'bac', 'bca', 'acb'
4 'abc', 'bac', 'bca', 'acb', 'cab'
5 'abc', 'bac', 'bca', 'acb', 'cab', 'cba'
END:['abc','acb','bac','bca','cab','cba']

BEGIN: 'aabb'
1 'aabb', 'abab'
2 'aabb', 'abab', 'abba'
3 'aabb', 'abab', 'abba', 'baab'
4 'aabb', 'abab', 'abba', 'baab', 'baba'  aabb abab baba -- aabb baab baba
5 'aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa'
END:['aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa']

DATA STRUCTURES
----------------
BEGIN: String
INBETWEEN: Array
END: Array

ALGORITHM
----------------
abc
- Prendre premier char de la string input [0]
  1 Le supprimer de sa place  [0]
  1 Le bouger a la prochaine place où ce n'est pas le même caractère [1]
  2 Le supprimer de sa place [0]
  2 Le bouger a la prochaine place où ce n'est pas le même caractère [2]
- Prendre deuxieme char de la string input [1]
  3 Le supprimer de sa place [1]
  3 Le bouger a la prochaine place où ce n'est pas le même caractère [2]
- Prendre premier char et deuxieme char de la string input [0..1]
  4 Le supprimer de sa place [0..1]
  4 Le bouger a la prochaine place où ce n'est pas les même caractères [1]
- Prendre troisieme et deuxieme char de la string input [2..1]
  5 Le supprimer de sa place [2..1]
  5 Le bouger a la prochaine place où ce n'est pas les même caractères [0]

aabb
- Prendre premier char de la string input [0]
  1 Le supprimer de sa place [0]
  1 Le bouger a la prochaine place où ce n'est pas le même caractère [2]
  2 Le supprimer de sa place [0]
  2 Le bouger a la prochaine place où ce n'est pas le même caractère [2]
- Prendre troisième char de la string input [2]
  3 Le supprimer de sa place [2]
  3 Le bouger à la prochaine place ou ce n'est pas le même caractère [0]
-

If the string is of length 1, return the string in an array.
For each character in the string:
Treat it as the first character.
Recursively compute the permutations of the rest of the string.
Combine the first character with each of the permutations of the rest of the string.
Remove any duplicates.

=end
def permutations(s)
  return [s] if s.length == 1

  result = []

  s.chars.each_with_index do |char, index|
    remaining = s[0...index] + s[index+1..-1]
    sub_permutations = permutations(remaining)
    sub_permutations.each do |perm|
      result << char + perm
    end
  end

  result.uniq
end

p permutations('aabb')
