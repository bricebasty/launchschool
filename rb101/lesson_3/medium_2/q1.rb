# frozen_string_literal: true

a = 'forty two'
b = 'forty two'
c = a

puts a.object_id # 160
puts b.object_id # 180
puts c.object_id # 160
