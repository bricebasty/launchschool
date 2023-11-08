def puts_in_console(line, test_str, arg_str)
  # Outputs method_return_value == expected_return_value
  puts  line.sub(test_str, "puts 'Test result is ' + (")
            .sub(arg_str, ") == ")
            .sub(/[\);]+$\n/, "") << ").to_s.upcase"
  # Outputs method_return_value
  puts  line.sub(test_str, "p ")
            .sub(arg_str, ") # ")
            .sub(/[\);]+$/, "")
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
describe "Solution" do
  it "should test for something" do
    Test.assert_equals(string_transformer('Example string'), 'STRING eXAMPLE')
  end
end
TEST

remove_tests(tests)
