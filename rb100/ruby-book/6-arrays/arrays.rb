# frozen_string_literal: true

# Ex 1
arr = [1, 3, 5, 7, 9, 11]
number = 3

p arr.include?(number)

# Ex 4
arr = [%w[test hello world], %w[example mem]]
p arr.last.first

# Ex 7
arr = %w[salut toi comment]
arr.each_with_index { |v, i| p i.to_s + v }

# Ex 8
array = %w[yo ca va]
p(array.map { |e| e * 2 })
