# frozen_string_literal: true

numbers = [1, 2, 3, 4, 5]
p(numbers.map { |e| e * 2 })

numbers = [5, 9, 21, 26, 39]
p(numbers.select { |e| (e % 3).zero? })

array1 = [1, 5, 9]
array2 = [1, 9, 5]
p array1 == array2
