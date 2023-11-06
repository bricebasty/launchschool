def puts_in_console(line, test_str, arg_str)
  puts  line.sub(test_str, "puts 'Test result is ' + (")
            .sub(arg_str, ") == ")
            .sub(/[);]+$\n/, "") << ").to_s.upcase"
  puts  line.sub(test_str, "p ")
            .sub(arg_str, ") # ")
            .sub(/[);]+$/, "")
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
describe('static tests') do
  it('basic recipes') do
    Test.assert_equals(cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}), 2)
    Test.assert_equals(cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}),11)
  end

  it('missing ingredient') do
    Test.assert_equals(cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}),0)
  end

  it('not enough ingredients') do
    Test.assert_equals(cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}),0)
  end

  it('no ingredients available') do
    Test.assert_equals(cakes({"eggs"=>4, "flour"=>400},{}),0)
  end

  it('exactly enough ingredients for 1 cake') do
    Test.assert_equals(cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}), 1)
  end

end
TEST

remove_tests(tests)
