# frozen_string_literal: true

def rps(fist1, fist2)
  if fist1 == 'rock'
    fist2 == 'paper' ? 'paper' : 'rock'
  elsif fist1 == 'paper'
    fist2 == 'scissors' ? 'scissors' : 'paper'
  else
    fist2 == 'rock' ? 'rock' : 'scissors'
  end
end

puts rps(rps(rps('rock', 'paper'), rps('rock', 'scissors')), 'rock')
#                 paper                rock
#                 paper
# a = "forty two"
b = 'forty two'
c = a

puts a.object_id
puts b.object_id
puts c.object_id
