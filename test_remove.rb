# "Test.assert_equals(to_camel_case(''), '', 'An empty string was provided but not returned')"
# "Test.assert_equals(to_camel_case('the_stealth_warrior'), 'theStealthWarrior', 'to_camel_case('the_stealth_warrior') did not return correct value')"
# "Test.assert_equals(to_camel_case('The-Stealth-Warrior'), 'TheStealthWarrior', 'to_camel_case('The-Stealth-Warrior') did not return correct value')"
# "Test.assert_equals(to_camel_case('A-B-C'), 'ABC', 'to_camel_case('A-B-C') did not return correct value')"

# Remove Test.assert_equals(
# Remove ,  and replace it by #
# Remove the last character in the string
#
# Test.assert_equals(to_camel_case(''), '', 'An empty string was provided but not returned')
# to_camel_case(''), '', 'An empty string was provided but not returned')

def remove_tests(a)
  a.each { |s| puts 'p ' + s[19..-2].sub("), ", ") # => ").sub(/,\s(.*)$/, '') }
end

tests =
  [
   'Test.assert_equals(find_even_index([1,2,3,4,3,2,1]),3)',
    'Test.assert_equals(find_even_index([1,100,50,-51,1,1]),1)',
    'Test.assert_equals(find_even_index([1,2,3,4,5,6]),-1)',
    'Test.assert_equals(find_even_index([20,10,30,10,10,15,35]),3)',
    'Test.assert_equals(find_even_index([20,10,-80,10,10,15,35]),0)',
    'Test.assert_equals(find_even_index([10,-80,10,10,15,35,20]),6)',
    'Test.assert_equals(find_even_index(Array(1..100)),-1)',
    'Test.assert_equals(find_even_index([0,0,0,0,0]),0,"Should pick the first index if more cases are valid")',
    'Test.assert_equals(find_even_index([-1,-2,-3,-4,-3,-2,-1]),3)',
    'Test.assert_equals(find_even_index(Array(-100..-1)),-1)'
  ]

remove_tests(tests)
