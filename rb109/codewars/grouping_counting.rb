# Your goal is to write the group_and_count method, which should receive and array
#  as unique parameter and return a hash. Empty or nil input must return nil instead of a hash.
#   This hash returned must contain as keys the unique values of the array, and as values the counting of each value.

# Example usage:

# input = [1,1,2,2,2,3]

# group_and_count(input)# == {1=>2, 2=>3, 3=>1}
# The following methods were disabled:

# Array#count
# Array#length
#
# for every element in input
# put in a hash
#
#

def group_and_count(input)
  return nil if input.empty? || input.nil?

  hash = {}
  input.each { |e| hash[e].nil? ? hash[e] = 1 : hash[e] += 1 }
  hash
end

p group_and_count([0,1,1,0])
