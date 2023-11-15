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
Test.assert_equals(triple_double(451999277, 41177722899), 1)
Test.assert_equals(triple_double(1222345, 12345), 0)
Test.assert_equals(triple_double(12345, 12345), 0)
Test.assert_equals(triple_double(666789, 12345667), 1)
Test.assert_equals(triple_double(10560002, 100), 1)
Test.assert_equals(triple_double(1112, 122), 0)
ttdd
TEST

remove_tests(tests)
