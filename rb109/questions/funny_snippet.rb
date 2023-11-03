string = "hey"
array = ["hey"]

def string_and_array_index(string, array)
	string[0] = "wh"
  string[0] << "e"
  string[0].upcase!
	array[0] = "hi"
  array[0] << "i"
  array[0].upcase!
end

string_and_array_index(string, array)
p string
p array
