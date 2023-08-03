# Exo 1
family = {  uncles: ["bob", "joe", "steve"],
  sisters: ["jane", "jill", "beth"],
  brothers: ["frank","rob","david"],
  aunts: ["mary","sally","susan"]
}

p siblings = family.select { |key, value| [:brothers, :sisters].include?(key) }
                    .values
                    .flatten

# Exo 3
p "keys"
family.each_key { p _1 }
p "values"
family.each_value { p _1 }
p "both"
family.each { p "#{_1}" + "#{_2}" }

# Exo 5
p family.value?("["jane", "jill", "beth"]")