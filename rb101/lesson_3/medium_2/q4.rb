# frozen_string_literal: true

def tricky_method_two(a_string_param, _an_array_param)
  a_string_param << 'rutabaga'
  %w[pumpkins rutabaga]
end

my_string = 'pumpkins'
my_array = ['pumpkins']
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
# output will be "pumpkinsrutabaga" on line 10 because we're mutating the object called with <<
# output will be ["pumpkins"] on line 11 because we're assigning a new object to an_array_param, thus not modifying the
# my_array ["pumpkins"] object
