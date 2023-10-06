# Given two ws, how many letters do you have to remove from them to make them anagrams?
#     Example
#     First w : c od e w ar s (4 letters removed)
#     Second w : ha c k er r a nk (6 letters removed)
#     Result : 10
#     Hints
#     A w is an anagram of another w if they have the same letters (usually in a different order).
#     Do not worry about case. All inputs will be lowercase.
#     When you're done with this kata, check out its big brother/sister : https://www.codewars.com/kata/hardcore-anagram-difference

# PROBLEM
# ---------------
# Given 2 ws, return an integer which represents the number of letters we have to remove to make them anagrams
#
# EXAMPLES
# ---------------
# 'a' 'a'
# 0
#
# '' ''
# 0
#
# 'ab' 'a'
#  1
#
# 'ababacd' 'bcdeaa'
# 'aaabbcd' 'aabcde'
# 'aabbcd' 'aabcde' 1
# 'aabcd' 'aabcde' 2
# 'aabcd' 'aabcd' 3
# 3
#
# 'codewars' 'hackerrank'
# 'acdeorsw' 'aacehkknrr'
# 'aceorsw' 'aacehkknrr' 1
# 'acersw' 'aacehkknrr' 2
# 'acerw' 'aacehkknrr' 3
# 'acer' 'aacehkknrr' 4
# 'acer' 'acehkknrr' 5
# 'acer' 'acehknrr' 6
# 'acer' 'aceknrr' 7
# 'acer' 'acenrr' 8
# 'acer' 'acerr' 9
# 'acer' 'acer' 10
# 10
#
# DATA STRUCTURES
# ---------------
# BEGINNING: STRINGS
# INBETWEEN: STRINGS
# END: INTEGER
#
# ALGORITHM
# ---------------
# - Sort both strings
# - Initialize an Integer variable
# - Until string1 == string2
#   - For each cacter in string 1
#     - It's not in string 2
#       OR
#     - If the count of the cacter in string1 is stricly bigger than in string2
#       - Delete the c
#       - Add one to the integer variable
#  - For each cacter in string 2
#     - It's not in string 1
#       OR
#     - If the count of the cacter in string2 is stricly bigger than in string1
#       - Delete the c
#       - Add one to the integer variable
#
#
# CODE
# ---------------

def anagram_difference(w1, w2)
  count = 0
  a = [w1, w2]
  [w1, w2].each_with_index do |w, i|
    w.each_char do |c|
      i == 0 ? i2 = 1 : i2 = 0
      if a[i].count(c) > a[i2].count(c) || !a[i2].include?(c)
        a[i].sub!(c, '')
        count += 1
      end
    end
  end
  p count
end




anagram_difference('aab', 'a') # 2
anagram_difference('a', 'aab') # 2
anagram_difference('codewars', 'hackerrank') # 10
