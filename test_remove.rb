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

def remove_tests(var)
  var.each_line do |line|
    # Use regex to capture the method call and the expected result
    match_data = line.match(/Test\.assert_equals\((.*?),\s*(.*?)(,\s*".*")?\)/)
    if match_data
      method_call = match_data[1]
      expected_result = match_data[2]
      comment = match_data[3] ? match_data[3].gsub(/^,\s*"/, '').chomp('"') : ""
      comment_text = comment.empty? ? "" : " - \"#{comment}\""
      puts "p #{method_call} # => #{expected_result}#{comment_text}"
    end
  end
end

tests = <<~TEST
Test.assert_equals(title_case(''), '')
Test.assert_equals(title_case('a clash of KINGS', 'a an the of'), 'A Clash of Kings')
Test.assert_equals(title_case('THE WIND IN THE WILLOWS', 'The In'), 'The Wind in the Willows')
Test.assert_equals(title_case('the quick brown fox'), 'The Quick Brown Fox')

TEST

remove_tests(tests)
