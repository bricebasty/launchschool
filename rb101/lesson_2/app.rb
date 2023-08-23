# frozen_string_literal: true

require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('db/messages.yml')

Dir[File.join(__dir__, 'lib', '*.rb')].each { |file| require file }

LANGUAGE = 'en'

def print_string(text, print_user: false)
  puts text
  print '> ' if print_user == true
end

def print_colorized_string(text, color_code, print_user: false)
  puts text.gsub("[c]", "\e[#{color_code}m").gsub("[nc]", "\e[0m")
  print '> ' if print_user == true
end

def display_menu
  print_colorized_string(MESSAGES[LANGUAGE]['main_menu'], 33, print_user: true)
end

def invalid_input_message
  sleep 0.5
  print_colorized_string(MESSAGES[LANGUAGE]['invalid_input'], 31)
  sleep 0.5
end

loop do
  display_menu
  input = gets.chomp.downcase

  case input
  when '1' then launch_calc_loop
  when '2' then launch_loan_loop
  when '3' then launch_game_loop
  when 'x' then break
  else invalid_input_message
  end
end
