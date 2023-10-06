def calc(value)
  count = 11
  array = (value..10).map { |e| [e, count -= 1] }
  array.each { |e| puts "10-#{e[0]} : #{e[1]} jours" }
end

calc(1)
