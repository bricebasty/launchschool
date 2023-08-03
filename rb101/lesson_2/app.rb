# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/calc'

def display_menu
  puts <<~MENU
    Choose an app :
    1 : Calc
    X : Stop app
  MENU
end

def choose_program
  loop do
    display_menu
    input = gets.chomp.downcase
    case input
    when '1' then calculator(input_number, input_number)
    when 'x' then break
    else puts 'Invalid input, try again.'
    end
  end
end

choose_program
