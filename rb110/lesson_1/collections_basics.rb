str = 'The grass is green'
p str[4, 5]

str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favorite color is blue"

p str.split.map(&:capitalize).join(" ")
