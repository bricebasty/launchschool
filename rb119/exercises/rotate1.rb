def rotate_array(array)
  array[1..-1] + [array[0]]
end

p rotate_array([1, 2, 3, 4, 5])

def rotate_string(string)
  string[1..-1] + string[0]
end

p rotate_string("string")

def rotate_integers(integer)
  (integer.to_s[1..-1] + integer.to_s[0]).to_i
end
p rotate_integers(1234)
