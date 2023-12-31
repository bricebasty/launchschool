# There is a queue for the self-checkout tills at the supermarket. Your task is
# write a function to calculate the total time required for all the customers to check out!

# input
# customers: an array of positive integers representing the queue. Each integer
# represents a customer, and its value is the amount of time they require to check out.
# n: a positive integer, the number of checkout tills.
# output
# The function should return an integer, the total time required.

# Important
# Please look at the examples and clarifications below, to ensure you understand
# the task correctly :)
# end

# Examples
# queue_time([5,3,4], 1)
# # should return 12
# # because when n=1, the total time is just the sum of the times

# queue_time([10,2,3,3], 2)
# # should return 10
# # because here n=2 and the 2nd, 3rd, and 4th people in the
# # queue finish before the 1st person has finished.

# queue_time([2,3,10], 2)
# should return 12
#
# Clarifications
# There is only ONE queue serving many tills, and
# The order of the queue NEVER changes, and
# The front person in the queue (i.e. the first element in the array/list) proceeds to a till as soon as it becomes free.
# N.B. You should assume that all the test input will be valid, as specified above.

# P.S. The situation in this kata can be likened to the more-computer-science-related
# idea of a thread pool, with relation to running multiple processes at the same
# time: https://en.wikipedia.org/wiki/Thread_pool

=begin
PROBLEM
----------------
INPUT: Array d'entier positifs, entier
OUTPUT: Entier

RULES:
- Chaque entier dans l'array représente le temps dont il a besoin pour acheter un truc
- Chaque entier représente le nombre de caisses a checkout
- Output = temps total requis
- Un client va après un autre quand la caisse est free
- Ordre ne change jamais
- Input sera toujours bon
- Array vide retourne 0

EXAMPLES
----------------
INPUT: [2,3,10], 2
=> []
=> 2 -> [2]
=> 3 -> [2, 3]
=> 10 -> [12, 3]
OUTPUT: 12

DATA STRUCTURES
----------------
INPUT: Array, integer
=> Array
OUTPUT: Integer

ALGORITHM
----------------

HIGH-LEVEL:

LOW-LEVEL:

Initialiser une liste vide
Itere sur chaque element de queue
  Si la size de la liste sum_array est strictement plus petite que tills
    push le client dans sum_array
  Sinon
    Prendre le plus petit nombre de la liste et additionner la valeur du client
Prendre le nombre le plus grand dans la liste

=end

def queue_time(queue, tills)
  return 0 if queue.empty?

  sum_array = []

  queue.each do |client|
    if sum_array.size < tills
      sum_array << client
    else
      sum_array[sum_array.index(sum_array.min)] += client
    end
  end

  sum_array.max
end

puts 'Test result is ' + (queue_time([], 1) == 0).to_s.upcase
p queue_time([], 1) # 0

puts 'Test result is ' + (queue_time([5], 1) == 5).to_s.upcase
p queue_time([5], 1) # 5

puts 'Test result is ' + (queue_time([2], 5) == 2).to_s.upcase
p queue_time([2], 5) # 2

puts 'Test result is ' + (queue_time([1,2,3,4,5], 1) == 15).to_s.upcase
p queue_time([1,2,3,4,5], 1) # 15

puts 'Test result is ' + (queue_time([1,2,3,4,5], 100) == 5).to_s.upcase
p queue_time([1,2,3,4,5], 100) # 5

puts 'Test result is ' + (queue_time([2,2,3,3,4,4], 2) == 9).to_s.upcase
p queue_time([2,2,3,3,4,4], 2) # 9
