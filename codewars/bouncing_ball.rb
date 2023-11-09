# A child is playing with a ball on the nth floor of a tall building. The height
# of this floor above ground level, h, is known.

# He drops the ball out of the window. The ball bounces (for example), to
# two-thirds of its height (a bounce of 0.66).

# His mother looks out of a window 1.5 meters from the ground.

# How many times will the mother see the ball pass in front of her window
# (including when it's falling and bouncing)?

# Three conditions must be met for a valid experiment:
# Float parameter "h" in meters must be greater than 0
# Float parameter "bounce" must be greater than 0 and less than 1
# Float parameter "window" must be less than h.
# If all three conditions above are fulfilled, return a positive integer,
# otherwise return -1.

# Note:
# The ball can only be seen if the height of the rebounding ball is strictly
# greater than the window parameter.

# Examples:
# - h = 3, bounce = 0.66, window = 1.5, result is 3

# - h = 3, bounce = 1, window = 1.5, result is -1

# (Condition 2) not fulfilled).
#
=begin
PROBLEM
----------------
INPUT:
- integer h representing the height (floor) at which a ball has been dropped
- float b representing the proprotion of the height the ball bounces each time
- float or integer w representing the window of where the mother is
OUTPUT: Integer, Number of times the mother will see the ball bouncing (up and down)

RULES:
- Float parameter "h" in meters must be greater than 0
- Float parameter "bounce" must be greater than 0 and less than 1
- Float parameter "window" must be less than h.
- Return -1 if the last 3 rules are not fulfilled

EXAMPLES
----------------
INPUT: 3, 0.66, 1.5
=> +1
=> 3/0.66 > 1.5 ? +2 : return
=>
OUTPUT: 3

DATA STRUCTURES
----------------
INPUT:
=>
OUTPUT:

NOTES:

ALGORITHM
----------------
create a variable holding the number of times it's been seen by the mother `seen` to 1
until h < window
  h =/ bounce
  add 2 to `seen` if h > window
end

=end
def bouncingBall(h, bounce, window)
  return -1 if h <= 0 || bounce <= 0 || bounce >= 1 || h <= window
  seen = 1
  until h < window
    h *= bounce
    seen += 2 if h > window
  end
  seen
end

puts 'Test result is ' + (bouncingBall(3, 0.66, 1.5) == 3).to_s.upcase
p bouncingBall(3, 0.66, 1.5) # 3

puts 'Test result is ' + (bouncingBall(30, 0.66, 1.5) == 15).to_s.upcase
p bouncingBall(30, 0.66, 1.5) # 15

puts 'Test result is ' + (bouncingBall(30, 0.75, 1.5) == 21).to_s.upcase
p bouncingBall(30, 0.75, 1.5) # 21

puts 'Test result is ' + (bouncingBall(30, 0.4, 10) == 3).to_s.upcase
p bouncingBall(30, 0.4, 10) # 3

puts 'Test result is ' + (bouncingBall(40, 1, 10) == -1).to_s.upcase
p bouncingBall(40, 1, 10) # -1

puts 'Test result is ' + (bouncingBall(-5, 0.66, 1.5) == -1).to_s.upcase
p bouncingBall(-5, 0.66, 1.5) # -1
