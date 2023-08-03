array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Ex 1
array.each { p _1 }

# Ex 2
array.each { p _1 if _1 > 5 }

# Ex 3
p new_array = array.select { _1.odd? }

# Ex 4
p array.push(11).unshift(0)

# Ex 5
p array.pop
p array.push(3)

# Ex 6
p array.uniq!

# Ex 8
hash1 = {:machin => 'test'}
hash2 = { machin: "test" }

# Ex 9
h = {a:1, b:2, c:3, d:4}

p h[:b]

p h[:e] = 5

p h.delete_if { |k, v| v < 3.5 }

# Ex 10
p hash_array = {name: "bob", properties: ["pizza lover", "barbecue enjoyer"]}
p array_hash = [{a:1, b:2}, {c:3, d:4}]

# Ex 11
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]
p contacts
# Expected output:
#  {
#    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
#    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
#  }

# Ex 12
p contacts["Joe Smith"][:email]
p contacts["Sally Johnson"][:phone]

# Ex 13
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

p arr.delete_if {|e| e[0] == "s"}

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

p arr.delete_if {|e| e[0] == 's' || e[0] == 'w'}

# Ex 14
a = ['white snow', 'winter wonderland', 'melting ice',
  'slippery sidewalk', 'salted roads', 'white trees']

p a.map(&:split).flatten

# Ex 16
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
                ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contact_info = [:email, :address, :phone]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts.each_with_index do |(contact_name, contact_details), contact_index|
  contact_info.each_with_index do |info_key, info_index|
    contact_details[info_key] = contact_data[contact_index][info_index]
  end
end


p contacts