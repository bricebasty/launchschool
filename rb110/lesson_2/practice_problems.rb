# arr = ['10', '11', '9', '7', '8']

# p arr.sort { |a, b| b.to_i <=> a.to_i }


# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# puts books.sort { |a, b| a[:published].to_i <=> b[:published].to_i }

# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# p arr1[2][1][3]

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# p arr2[1][:third][0]

# arr3 = [['abc'], ['def'], {third: ['ghi']}]
# p arr3[2][:third][0][0]

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# p hsh1['b'][1]

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
# p hsh2[:third].key(0)

# arr1 = [1, [2, 3], 4]
# arr1[1][1] = 4
# p arr1

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# arr2[2] = 4
# p arr2

# hsh1 = {first: [1, 2, [3]]}
# hsh1[:first][2][0] = 4
# p hsh1

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
# hsh2[['a']][:a][2] = 4
# p hsh2

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# p munsters.select { |_, v| v['gender'] == "male" }.sum { |_, v| v["age"] }

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.each { |k, v| puts "#{k} is a #{v["age"]}-years-old #{v["gender"]}" }

# (Name) is a (age)-year-old (male or female).

# a = 2
# b = [5, 8]
# arr = [a, b] # arr = [2, [5, 8]]

# arr[0] += 2 # arr = [4, [5, 8]], a = 2
# arr[1][0] -= a # arr = [4, [3, 8]], a = 2, b = [3, 8]
# p arr
# p a
# p b

# h = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
# # all of the vowels from strings
# h.each { |_, a| a.each { |s| s.chars.each { |c| puts c if c.match?(/[aeiou]/i) } } }

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
# p arr.map { |sub_arr| sub_arr.sort {|a, b| b <=> a} }

# arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
# p arr.map { |h| h.each { |k, v| h[k] += 1 } }

# # [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]

# arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

# p arr.map { |sub_arr| sub_arr.select { |n| n % 3 == 0 } }
# # [[], [3, 12], [9], [15]]

# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# # {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
# p arr.each_with_object({}) { |sub_arr, hash| hash[sub_arr[0]] = sub_arr[1] }

# arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
# # [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

# p arr.sort_by { |sub| sub.select{ |n| n.odd? } }
# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# # [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
# p hsh.map { |_, v| v[:type] == 'fruit' ? v[:colors].map(&:capitalize) : v[:size].upcase }

# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# p arr.select { |h| h.all? { |_, v| v.all? { |n| n.even? } } }

# def generate_uuid
#   hexadecimal_chars = "0123456789abcdef"
#   uuid = ""
#   separators_indexes = [7, 11, 15, 19]

#   32.times do |iteration|
#     uuid += hexadecimal_chars[rand(15)]
#     uuid += "-" if separators_indexes.include?(iteration)
#   end

#   uuid
# end

a < b == c
