# frozen_string_literal: true

APR = 6
LOAN_DURATION = 10

def convert_apr(apr)
  (apr / 100) / 12
end

def convert_years_to_months(years)
  years * 12
end

def get_loan_amount
  loop do
    print_string("What's your loan's amount?", print_user: true)
    loan_amount = gets.chomp
    if loan_amount.empty?() || loan_amount.to_f() < 0
      print_colorized_string(MESSAGES[LANGUAGE]['invalid_input'], 31)
    else
      return loan_amount.to_f
    end
  end
end

def get_apr
  loop do
    print_string("What's the interest rate? (in percentage)", print_user: true)
    apr = gets.chomp
    if apr.empty?() || apr.to_f() < 0
      print_colorized_string(MESSAGES[LANGUAGE]['invalid_input'], 31)
    else
      return convert_apr(apr.to_f)
    end
  end
end

def get_loan_duration
  loop do
    print_string("What's your loan's duration? (in years)", print_user: true)
    loan_duration = gets.chomp
    if loan_duration.empty?() || loan_duration.to_i() < 0
      print_colorized_string(MESSAGES[LANGUAGE]['invalid_input'], 31)
    else
      return convert_years_to_months(loan_duration.to_i)
    end
  end
end

def calculate_and_display_loan_details(loan_amount, monthly_interest_rate,
                                       loan_duration)
  monthly_payment =
    loan_amount *
    (monthly_interest_rate / (1 - ((1 + monthly_interest_rate)**(-loan_duration))))
  puts <<~LOAN

  \e[32mMonthly interest rate: #{(monthly_interest_rate * 100).round(2)}%
  \e[33mLoan duration in months: #{loan_duration}
  \e[34mMonthly payment: #{monthly_payment.round(2)}

  LOAN
end

def launch_loan_loop
  loop do
    calculate_and_display_loan_details(get_loan_amount,
                                       get_apr,
                                       get_loan_duration)

    print_colorized_string(MESSAGES[LANGUAGE]['start_again'], 35,
                           print_user: true)

    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
end
