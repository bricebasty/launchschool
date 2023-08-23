# First one

def mess_with_vars1(_one, two, _three)
  two
end

one1 = 'one' # 1
two1 = 'two' # 2
three1 = 'three' # 3

mess_with_vars1(one1, two1, three1)

puts "one is: #{one1}" # one
puts "two is: #{two1}" # two
puts "three is: #{three1}" # three

# Second one

def mess_with_vars2(_one, _two, _three)
  'one'
end

one2 = 'one'
two2 = 'two'
three2 = 'three'

mess_with_vars2(one2, two2, three2)

puts "one is: #{one2}" # one
puts "two is: #{two2}" # two
puts "three is: #{three2}" # three

def mess_with_vars3(one, two, three)
  one.gsub!('one', 'two')
  two.gsub!('two', 'three')
  three.gsub!('three', 'one')
end

one3 = 'one'
two3 = 'two'
three3 = 'three'

mess_with_vars3(one3, two3, three3)

puts "one is: #{one3}" # two
puts "two is: #{two3}" # three
puts "three is: #{three3}" # one
