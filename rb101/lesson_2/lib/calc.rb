# frozen_string_literal: true

def add(a, b)
  puts "\n#{a} + #{b} is #{a + b}\n\n"
end

def substract(a, b)
  puts "\n#{a} - #{b} is #{a - b}\n\n"
end

def multiply(a, b)
  puts "\n#{a} x #{b} is #{a * b}\n\n"
end

def divide(a, b)
  puts "\n#{a} / #{b} is #{a / b}\n\n"
end

def display_calc_menu
  puts <<~MENU
    Choose an action :
    + : Add
    - : Substract
    x : Multiply
    / : Divide
  MENU
end

def calculator(a, b)
  loop do
    display_calc_menu
    input = Kernel.gets().chomp()
    case input
    when "+" then add(a, b); break
    when "-" then substract(a, b); break
    when "x" then multiply(a, b); break
    when "/" then divide(a, b); break
    else puts "Invalid input"
    end
  end
end

def input_number
  puts 'Input number'
  print '> '
  Kernel.gets().chomp().to_i
end

