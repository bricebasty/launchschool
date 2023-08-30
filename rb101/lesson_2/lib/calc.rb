# frozen_string_literal: true

def display_calculator_menu
  print_colorized_string(MESSAGES[LANGUAGE]['calc_menu'], 31)
  print '> '
end

def get_operator_and_calculate(first_number, second_number)
  operator = nil

  loop do
    display_calculator_menu
    operator = gets.chomp.downcase
    break if %w[+ - * / x].include?(operator)

    invalid_input_message
  end
  calculate_and_display_result(first_number, operator, second_number)
end

def get_user_number
  input = nil
  loop do
    print_colorized_string(MESSAGES[LANGUAGE]['enter_number'], 34,
                           print_user: true)
    input = gets.chomp.downcase
    break if number?(input)

    invalid_input_message
  end
  input
end

def number?(str)
  [str.to_f.to_s, str.to_i.to_s].include?(str)
end

def calculate_and_display_result(first_number, operator, second_number)
  case operator
  when '/' then result = first_number.to_f.send(operator, second_number.to_f)
  when '+', '-', '*' then result = first_number.to_i.send(operator,
                                                          second_number.to_i)
  when 'x' then exit
  end

  puts "\n\e[32m\e[1m#{first_number} #{operator} #{second_number} = #{result}"
  print "\e[0m"
  sleep 0.2
end

def launch_calc_loop
  loop do
    get_operator_and_calculate(get_user_number, get_user_number)

    print_colorized_string(MESSAGES[LANGUAGE]['start_again'], 35,
                           print_user: true)

    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
end
