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
Test.assert_equals(is_anagram('Creative', 'Reactive'), true, 'The word Creative is an anagram of Reactive')
Test.assert_equals(is_anagram("foefet", "toffee"), true, 'The word foefet is an anagram of toffee')
Test.assert_equals(is_anagram("Buckethead", "DeathCubeK"), true, 'The word Buckethead is an anagram of DeathCubeK')
Test.assert_equals(is_anagram("Twoo", "WooT"), true, 'The word Twoo is an anagram of WooT')
Test.assert_equals(is_anagram("dumble", "bumble"), false, 'Characters do not match for test case dumble, bumble')
Test.assert_equals(is_anagram("ound", "round"), false, 'Missing characters for test case ound, round')
Test.assert_equals(is_anagram("apple", "pale"), false, 'Same letters, but different count')
TEST

remove_tests(tests)
