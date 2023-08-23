# frozen_string_literal: true

def tricky_method(_string_param_one, string_param_two)
  string_param_two << 'rutabaga'
end

string_arg_one = 'pumpkins'
string_arg_two = 'pumpkins'
tricky_method(string_arg_one, string_arg_two)

puts "String_arg_one looks like this now: #{string_arg_one}"
puts "String_arg_two looks like this now: #{string_arg_two}"

# What will be displayed and why?
# line 10 will output "pumpkins" because += is reassigning to a new object id, thus not modifying the original "pumpkins"
# object
# line 11 will output "pumpkins rutabaga" because << operator mutates its caller. In this case it mutates string_param_two
# which is referencing itself to the same object as string_arg_two
