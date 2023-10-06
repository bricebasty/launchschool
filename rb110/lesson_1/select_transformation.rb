# def select_fruit(produce)
#   values = produce.values
#   keys = produce.keys
#   counter = 0
#   fruits = []

#   loop do
#     break if counter == values.length

#     if values[counter] == 'Fruit'
#       fruits << keys[counter]
#     end

#     counter += 1
#   end

#   fruits
# end

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}


def multiply(numbers, factor)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    multiplied_numbers << numbers[counter] * factor
    counter += 1
  end

  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
