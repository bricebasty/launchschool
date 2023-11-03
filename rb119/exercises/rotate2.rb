def rotate_rightmost_digits(integer, rotation)
  return integer if rotation == 1
  array = integer.digits.reverse
  return (array[1..-1] + [array[-rotation]]).join.to_i if rotation == integer.to_s.size
  (array[0..-rotation - 1] + array[-rotation + 1..-1] + [array[-rotation]]).join.to_i
end

=begin
EXAMPLES

BEGIN: 735291, 2
=> "7", "3", "5", "2", "9", "1"
=> [0..-3] + [-1..-1] + [-2]
END: 735219

BEGIN: 735291, 3
=> "7", "3", "5", "2", "9", "1"
=> [0..-4] + [4..-1] + [-3]
=> [0..-4] + [-2..-1] + [-3]
END: 735912

BEGIN: 735291, 4
=> "7", "3", "5", "2", "9", "1"
=> [0..1] + [-3..-1] + [-4]
END: 732915

BEGIN: 735291, 5
=> "7", "3", "5", "2", "9", "1"
=> [0..0] + [-4..-1] + [-5]
END: 752913

BEGIN: 735291, 6
=> "7", "3", "5", "2", "9", "1"
=> [1..-1] + [-6]
END: 352917

DATA STRUCTURE
=end
p rotate_rightmost_digits(735291, 1)  == 735291
p rotate_rightmost_digits(735291, 2)  == 735219
p rotate_rightmost_digits(735291, 3)  == 735912
p rotate_rightmost_digits(735291, 4)  == 732915
p rotate_rightmost_digits(735291, 5)  == 752913
p rotate_rightmost_digits(735291, 6)  == 352917
