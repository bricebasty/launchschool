def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil
loop do
  puts "Nominator"
  print "> "
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts "Only integers allowed"
end

denominator = nil
loop do
  puts "Denominator"
  print "> "
  denominator = gets.chomp
  if denominator == '0'
    puts "Can't divide by 0"
  else
    break if valid_number?(denominator)
    puts "Only integers allowed"
  end
end

puts "#{numerator} / #{denominator} = #{ numerator.to_i / denominator.to_i }"
