# frozen_string_literal: true

def valid_number?(number_string)
  Integer(number_string)
rescue StandardError
  false
end

def read_number(prompt)
  loop do
    puts prompt
    number = gets.chomp
    return number.to_i if valid_number?(number) && number.to_i != 0

    puts '>> Invalid input. Only non-zero integers are allowed.'
  end
end

first_number = read_number('>> Please enter a positive or negative integer:')
second_number = read_number('>> Please enter another positive or negative integer with a different sign:')

sum = first_number + second_number
puts "#{first_number} + #{second_number} = #{sum}"
