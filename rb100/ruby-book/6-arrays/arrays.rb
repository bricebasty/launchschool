# Ex 1
arr = [1, 3, 5, 7, 9, 11]
number = 3

p arr.include?(number)

# Ex 4
arr = [["test", "hello", "world"],["example", "mem"]]
p arr.last.first

# Ex 7
arr = ["salut", "toi", 'comment']
arr.each_with_index { |v, i| p i.to_s + v }

# Ex 8
array = ['yo', 'ca', 'va']
p new_array = array.map { |e| e * 2}