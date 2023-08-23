# frozen_string_literal: true

def tricky_method(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param << 'rutabaga'

  [a_string_param, an_array_param]
end

my_string = 'pumpkins'
my_array = ['pumpkins']
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# How can we change this code to make the result easier to predict and easier for the next programmer to maintain?
# That is, the resulting method should not mutate either argument,
# but my_string should be set to 'pumpkinsrutabaga' and my_array should be set to ['pumpkins', 'rutabaga']
#
#
