# frozen_string_literal: true

def in_between(n)
  if n >= 0 && n <= 50 then puts "#{n} is in between 0 and 50"
  elsif n > 50 && n <= 100 then puts "#{n} is in between 51 and 100"
  elsif n > 100 then puts "#{n} is above 100"
  else
    puts 'Number is negative'
  end
end

in_between(gets.chomp.to_f)

arr = [1, 3, 5, 7, 9, 11]
number = 3

p arr.include?(number)
