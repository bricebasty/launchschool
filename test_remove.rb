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
describe("random tests") do
  Test.assert_equals(solve(123056,1),'12056')
  Test.assert_equals(solve(123056,2),'1056')
  Test.assert_equals(solve(123056,3),'056')
  Test.assert_equals(solve(123056,4),'05')
  Test.assert_equals(solve(1284569,1),'124569')
  Test.assert_equals(solve(1284569,2),'12456')
  Test.assert_equals(solve(1284569,3),'1245')
  Test.assert_equals(solve(1284569,4),'124')
  end
TEST

remove_tests(tests)
