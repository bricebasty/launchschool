# Complete the function scramble(str1, str2) that returns true if a portion of
# str1 characters can be rearranged to match str2, otherwise returns false.

# Notes:

# Only lower case letters will be used (a-z). No punctuation or digits will be included.
# Performance needs to be considered.
# Examples
# scramble('rkqodlw', 'world') ==> True
# scramble('cedewaraaossoqqyt', 'codewars') ==> True
# scramble('katas', 'steak') ==> False

#
# PROBLEM
# ----------------
# INPUT:
# - string of random letters
# - string of a word
# OUTPUT:
# - true if string of word contains every letter in random letters
# - false otherwise
# RULES:
# - performance is important

# EXAMPLES
# ----------------
# 'rkqodlw' STR
# => {r: 1, k: 1, q: 1, o: 1, d: 1, l: 1, w: 1} - "world"
# = >
# => true BOOLEAN
#
# 'cedewaraaossoqqyt' - 'codewars'
# => {"c"=>1, "e"=>2, "d"=>1, "w"=>1, "a"=>3, "r"=>1, "o"=>2, "s"=>2} - "codewars"
# => "codewars"
# => true
#
# 'katas' - steak
# => ["k", "a", "t", "a", "s"]
# => ["k", "a", "t", "s"]
# => ["a", "t", "s"]
# => false
#
# 'scriptingjava' - 'javascript'
# => ["s", "c", "r", "i", "p", "t", "i", "n", "g", "j", "a", "v", "a"]
# => ["s", "c", "r", "i", "p", "t", "n", "g", "j", "a", "v"]
#
# DATA STRUCTURES
# ----------------
# INPUT: STRING
# INBETWEEN: ARRAY
# OUTPUT: BOOLEAN

# OTHER:
# - include?
# - chars
# - all?
# - uniq

# ALGORITHM
# ----------------

# - Put into a hash the count of every character in the first string
# - For each pair in the hash
#   - keys in the hash have their count in the string equal or greater than the associated value
# {a: 1} codewars

# CODE
# ---------------

def scramble(s1, s2)
  hash = {}
  s1.each_char do |c|
    next unless s2.include?(c)
    hash[c] = s1.count(c)
  end
  hash.all? { |k, v| v >= s2.count(k.to_s) }
end

# p scramble('rkqodlw', 'world') # ==> True
p scramble('cedewaraaossoqqyt', 'codewars') # ==> True
p scramble('katas', 'steak') # ==> False
p scramble('scriptingjava', 'javascript')
p scramble('scriptjavx', 'javascript')
