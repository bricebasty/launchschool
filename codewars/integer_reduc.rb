# In this Kata, you will be given two integers n and k and your task is to remove
# k-digits from n and return the lowest number possible, without changing the
# order of the digits in n. Return the result as a string.

# Let's take an example of solve(123056,4). We need to remove 4 digits from 123056
# and return the lowest possible number. The best digits to remove are (1,2,3,6)
# so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

# Note also that the order of the numbers in n does not change: solve(1284569,2)
# = '12456', because we have removed 8 and 9.

# More examples in the test cases.

# Good luck!
=begin
PROBLEM
----------------
INPUT: Two integers n and k
OUTPUT: Integer with k digits removed, being the lowest possible number

RULES:
- DOn't change the order of digits in n
- 0 will be removed from the integer at the end
- Remove k integers so that n becomes the lowest possible integer

EXAMPLES
----------------
INPUT: 123056, 1 (size 6)
=> []

=> 123056.dup.delete_at(index)
=> [23056]

=> 123056 -> 1 & 3056
=> [23056, 13056]

=> [23056, 13056, 12056, 12356, 12306, 12305] (size 6)
OUTPUT: 12056

INPUT: 123056, 2 (size 6)
=> [3056, 1056, 1256, 1236, 1230] (size 5)
OUTPUT: 1056

INPUT: 123056, 3 (size 6)
=> [056, 156, 126, 123] (size 4)
OUTPUT: 056

INPUT: 1284569, 1 (size 7)
=> [284569, 184569, 124569, 128569, 128469, 128459, 128456] (size 7)
OUTPUT: 124569

!INPUT: 12845, 2
=> 845 enleve 0er et 1e
=> 145 enleve 1e et 2e
=> 125 enleve 2e et 3e
=> 128 enleve 3e et 4e

=> 245 enleve 0er et 2e
=> 285 enleve 1e et 3e
=> 124 enleve 2e et 4e

=> 285 enleve 0er et 3e
=> 184 enlever 1e et 4e

=> 284 enleve 0er et 4e

OUTPUT: 124

DATA STRUCTURES
----------------
INPUT:Integer
=> Array of integers
OUTPUT: Integer

NOTES:

ALGORITHM
----------------
Convert

  (0...n.to_s.size - (k - 1)).each_with_object({}) do |i, hash| # 6 - (1 - 1)
    number = n.dup.to_s # number = "12345"
    number[i, k] = "" # number
    hash[number] = number.to_i
  end.min_by { |_, v| v }[0]



  !INPUT: 12845, 2
  Créer variable starting index à 0
  Créer variable end index à 1

  Jusqu'à ce que end index = size - 1 et start index = 0

  Jusqu'à ce que end index = size - 1

=> 845 enleve 0er et 1e
  start index += 1 et end index += 1
=> 145 enleve 1e et 2e
  start index += 1 et end index += 1
=> 125 enleve 2e et 3e
  start index += 1 et end index += 1
=> 128 enleve 3e et 4e
  start index += 1 et end index += 1
  Stop

end index += 1
  Jusqu'à ce que end index = size - 1

=> 245 enleve 0er et 2e
  start index += 1 et end index += 1
=> 285 enleve 1e et 3e
=> 124 enleve 2e et 4e

  Jusqu'à ce que end index = size - 1

=> 285 enleve 0er et 3e
=> 184 enlever 1e et 4e

=> 284 enleve 0er et 4e

OUTPUT: 12456

=end
def solve(n, k)
  digits = n.to_s.chars

  k.times do
    remove_index = digits.size - 1
    digits.each_with_index do |digit, index|
      if index < digits.size - 1 && digit > digits[index + 1]
        remove_index = index
        break
      end
    end
    digits.delete_at(remove_index)
  end

  result = digits.join
  result.empty? ? '0' : result
end


puts 'Test result is ' + (solve(123056,1) == '12056').to_s.upcase
p solve(123056,1) # '12056'

puts 'Test result is ' + (solve(123056,2) == '1056').to_s.upcase
p solve(123056,2) # '1056'

puts 'Test result is ' + (solve(123056,3) == '056').to_s.upcase
p solve(123056,3) # '056'

puts 'Test result is ' + (solve(123056,4) == '05').to_s.upcase
p solve(123056,4) # '05'

puts 'Test result is ' + (solve(1284569,1) == '124569').to_s.upcase
p solve(1284569,1) # '124569'

puts 'Test result is ' + (solve(1284569,2) == '12456').to_s.upcase
p solve(1284569,2) # '12456'

puts 'Test result is ' + (solve(1284569,3) == '1245').to_s.upcase
p solve(1284569,3) # '1245'

puts 'Test result is ' + (solve(1284569,4) == '124').to_s.upcase
p solve(1284569,4) # '124'
