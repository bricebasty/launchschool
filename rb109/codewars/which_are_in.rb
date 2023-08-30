# Given two arrays of strings a1 and a2 return a sorted array r in lexicographical
#  order of the strings of a1 which are substrings of strings of a2.

# Example 1:
# a1 = ["arp", "live", "strong"]

# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# returns ["arp", "live", "strong"]

# Example 2:
# a1 = ["tarp", "mice", "bull"]

# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# returns []

# Notes:
# Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.
# In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.
# Beware: In some languages r must be without duplicates.
#
# selectionner dans array1 les elements qui
# sont inclus dans au moins 1 element de array2

def in_array(array1, array2)
  array1.select { |i| array2.any? { |e| e.include?(i) } }
end

a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
p in_array(a1, a2) # ["arp", "live", "strong"]
a1 = ["tarp", "mice", "bull"]
p in_array(a1, a2) # []
