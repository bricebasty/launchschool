# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# p(flintstones.each_with_object({}).with_index { |(e, h), i| h[e] = i })

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# p ages.values.sum

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# p(ages.reject { |_, v| v >= 100 })

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# p ages.values.min

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# p flintstones.index { |e| e.start_with?("Be") }

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# p flintstones.map! { |e| e[0..2] }


# statement = "The Flintstones Rock"

# p statement.gsub(/\s/, "").chars.tally

# numbers = [1, 2, 3, 4]
# numbers.each do |number| # number = 1, number = 3
#   p number # 1, 3
#   numbers.shift(1) # [3, 4]
# end

# numbers = [1, 2, 3, 4]
# numbers.each do |number| # number = 2
#   p number # 1, 2
#   numbers.pop(1) # [1, 2]
# end

# words = "the flintstones rock"

# p words.split.map(&:capitalize).join(' ')


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 18, "gender" => "female"}
}

munsters.each do |_, details|
  case details["age"]
  when 1...18 then details["age_group"] = "kid"
  when 18...65 then details["age_group"] = "adult"
  else details["age_group"] = "senior"
  end
end

puts munsters
