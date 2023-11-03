# typed: true

# my_arr = [[18, 7], [3, 12]].each do |arr| # arr = [3, 12]
#   arr.each do |num| # num = 12
#     if num > 5 # 12 > 5
#       puts num # 18, 7, 12
#     end
#   end
# end

# # => [[18, 7], [3, 12]]

# [[1, 2], [3, 4]].map do |arr| # arr = [1, 2]
#   arr.map do |num| # num = 1
#     num * 2 # 2, 4
#   end # [[2, 4], [6, 8]]
# end

# [{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash| # hash = { a: 'ant', b: 'elephant' }
#   hash.all? do |key, value| # key = :b, value = 'elephant'
#     value[0] == key.to_s  #
#   end #[false, true]
# end
# # => [{ :c => "cat" }]

# def method
#   [[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
#     arr.select do |item|
#       if item.is_a?(Integer)   # if it's an integer
#         item > 13
#       else
#         item.size < 6
#       end
#     end
#   end
# end
# # => [[27], ["apple"]]
# p method

# [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1| # element1 = [[1], [2], [3], [4]]
#   element1.each do |element2| # element2 = [1]
#     element2.partition do |element3| #element3 = # 1
#       element3.size > 0
#     end # []
#   end
# end

[[[1, 2], [3, 4]], [5, 6]].map do |arr| # arr = [[1, 2], [3, 4]]
  arr.map do |el| # el = [3, 4]
    if el.to_s.to_i == el   # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n| # n = 3
        n + 1 # 4
      end
      # return [[2, 3], [4, 5]]
    end
  end
end
