puts 'First Name?'
first_name = gets.chomp
puts 'Last Name?'
last_name = gets.chomp
puts "Hi #{first_name} #{last_name}"

10.times { |i| puts "#{i + 1}. Hi #{first_name} #{last_name}" }