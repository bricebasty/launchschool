# p (1...20).sum { |e| (e % 3).zero? || (e % 5).zero? ? e : 0 }

# final_sum = 0

# (1...10).each do |n|
#   puts "Nombre: #{n}"
#   if n % 3 == 0 || n % 5 == 0 # is_multiple_of_3_or_5?(n)
#     puts "Somme finale: #{final_sum += n}"
#   end
# end

p (1...10).each_with_object([]) { |e, a| a << e }
p (1..10 - 2).each_with_object([]) { |e, a| a << e }
p (1..10).each_with_object([]) { |e, a| a << e }
