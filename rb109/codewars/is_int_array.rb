# Write a function with the signature shown below:

# def is_int_array(arr)
#   true
# end
# returns true  / True if every element in an array is an integer or a float with no decimals.
# returns true  / True if array is empty.
# returns false / False for every other input.

def is_int_array(arr)
  return true if arr.empty?

  arr.all? { |n| n.integer? || num == num.to_i }
end
