def puts_in_console(line, test_str, arg_str)
  puts  line.sub(test_str, "puts 'Test result is ' + (")
            .sub(arg_str, ") == ")
            .sub(/[);]+$\n/, "") << ").to_s.upcase"
  puts  line.sub(test_str, "p ")
            .sub(arg_str, ") # ")
            .sub(/[);]+$/, "")
  puts
end

def remove_tests(var)
  var.each_line do |line|
    case line
    when /Test\.assert_equals/
      puts_in_console(line, /Test\.assert_equals\(/, /\)\,\s?/)
    when /expect\(/
      puts_in_console(line, /expect\(/, /\)\)\.to\seq\(\s?/)
    end
  end
end

tests = <<~TEST
describe("Basic tests") do
  Test.assert_equals(scramble_words('professionals'), 'paefilnoorsss', 'The first and last letters of a word should reamin in place with the inner letters sorted')
  Test.assert_equals(scramble_words('i'), 'i', 'Must handle single charater words')
  Test.assert_equals(scramble_words(''), '', 'Must handle empty strings')
  Test.assert_equals(scramble_words('me'), 'me', 'Must handle 2 charater words')
  Test.assert_equals(scramble_words('you'), 'you', 'Must handle 3 charater words')
  Test.assert_equals(scramble_words('card-carrying'), 'caac-dinrrryg', 'Only spaces separate words and punctuation should remain at the same place as it started')
  Test.assert_equals(scramble_words("shan't"), "sahn't", 'Punctuation should remain at the same place as it started')
  Test.assert_equals(scramble_words('-dcba'), '-dbca', 'Must handle special character at the start')
  Test.assert_equals(scramble_words('dcba.'), 'dbca.', 'Must handle special character at the end')
  Test.assert_equals(scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth."), "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth.", 'Must handle a full sentence')
  end
TEST

remove_tests(tests)
