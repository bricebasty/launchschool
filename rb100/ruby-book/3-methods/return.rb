# frozen_string_literal: true

def add_three(n)
  new_value = n + 3
  puts new_value
  new_value
end

add_three(4).times { p 'yo' }
