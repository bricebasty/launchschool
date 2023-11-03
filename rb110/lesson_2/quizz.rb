# todo_lists = [
#   {
#     id: 1,
#     list_name: 'Groceries',
#     todos: [
#       { id: 1, name: 'Bread', completed: false },
#       { id: 2, name: 'Milk', completed: false },
#       { id: 3, name: 'Apple Juice', completed: false }
#     ]
#   },
#   {
#     id: 2,
#     list_name: 'Homework',
#     todos: [
#       { id: 1, name: 'Math', completed: false },
#       { id: 2, name: 'English', completed: false }
#     ]
#   }
# ]
# # # 1
# todo_lists[1].each do |list_key, list_value|
#   if list_key == :todos
#     list_value.each { |todo| todo[:completed] = true }
#   end
# end
# # #  2
# todo_lists[1][:todos][0][:completed] = true
# todo_lists[1][:todos][1][:completed] = true
# # # 3
# todo_lists.each do |list|
#   if list[:list_name] == 'Homework'
#     list[:todos].each do |todo|
#       todo[:completed] = true
#     end
#   end
# end
# # # 4
# todo_lists[1][:todos].each do |todo|
#   todo[:completed] = true
# end

# a = 'hi'
# english_greetings = ['hello', a, 'good morning'] # ['hello', 'hi', 'good morning']

# greetings = {
#   french: ['bonjour', 'salut', 'allo'],
#   english: english_greetings, # ['hello', 'hi', 'good morning']
#   italian: ['buongiorno', 'buonasera', 'ciao']
# }

# greetings[:english][1] = 'hey'
# # greetings = {
# #   french: ['bonjour', 'salut', 'allo'],
# #   english: ['hello', 'hey', 'good morning']
# #   italian: ['buongiorno', 'buonasera', 'ciao']
# # }

# greetings.each do |language, greeting_list|
#   greeting_list.each { |greeting| greeting.upcase! }
# end

# puts a # 'hi'
# puts english_greetings[1] # 'HEY'
# puts greetings[:english][1] # 'HEY'

# [['a', 'b'], ['c', 'd'], ['e', 'f']].map do |sub_arr| # sub_arr = ['a', 'b']
#   sub_arr.map do |letter| # letter = 'a'
#     letter.upcase
#   end # ['A', 'B']
# end

# DATA
customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  }
]

# FORMAT TO GET

# QUESTION 10
# fulfilled_orders = customer_orders.map do |customer|
#   {
#     customer_id: customer[:customer_id],
#     customer_name: customer[:customer_name]
#   }
# end

fulfilled_orders = customer_orders.map do |customer|
  {
    customer_id: customer[:customer_id],
    customer_name: customer[:customer_name]
  }
end

customer_orders.each_with_index do |data, index|
  order_value = data[:orders].reduce(0) do |total, order|
    total + order[:order_value] if order[:order_fulfilled]
  end

  fulfilled_orders[index][:order_value] = order_value
end

pp fulfilled_orders
