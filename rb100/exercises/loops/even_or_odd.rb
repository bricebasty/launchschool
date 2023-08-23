# frozen_string_literal: true

count = 1

loop do
  p "#{count} is #{count.odd? ? 'odd' : 'even'}!"

  break if (count += 1) > 5
end
