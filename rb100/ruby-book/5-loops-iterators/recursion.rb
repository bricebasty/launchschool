def count_to0(n)
  puts n
  count_to0(n-1) if n > 0
end

count_to0(10)