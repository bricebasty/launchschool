# frozen_string_literal: true

def count_to0(n)
  puts n
  count_to0(n - 1) if n.positive?
end

count_to0(10)
