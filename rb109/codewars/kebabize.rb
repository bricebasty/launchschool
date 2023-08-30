# Modify the kebabize function so that it converts a camel case string into a kebab case.

# "camelsHaveThreeHumps"  -->  "camels-have-three-humps"
# "camelsHave3Humps"  -->  "camels-have-humps"
# "CAMEL"  -->  "c-a-m-e-l"
# Notes:

# the returned string should only contain lowercase letters

# delete numbers
# split la string quand il y a une majuscule
#

def kebabize(str)
  p str.gsub(/[0-9]+/, '').gsub(/[A-Z]+/) { |m| "-#{m.downcase}" }
end

kebabize('myCamelCasedString') # --> 'my-camel-cased-string')
kebabize('myCamelHas3Humps') # --> 'my-camel-has-humps')

p ["element3", "element4", "element5"].count("element3")
# Output: ["1", "10", 5, "2", "apple"]
