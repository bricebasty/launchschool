# frozen_string_literal: true

# exception_example.rb

names = ['bob', 'joe', 'steve', nil, 'frank']

names.each do |name|
  puts "#{name}'s name has #{name.length} letters in it."
rescue StandardError
  puts 'Something went wrong!'
end
