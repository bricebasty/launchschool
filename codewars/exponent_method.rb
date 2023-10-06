# Create a method called "power" that takes two integers and returns the value of the first argument raised to the power of the second. Return nil if the second argument is negative.

# Note: The ** operator has been disabled.

# Examples:

# power(2, 3) # 8
# power(10, 0) # 1
# power(-5, 3) # -125
# power(-4, 2) # 16
#
# multiplier la base par la base exponent nombre de fois
# 3^5
# 1ere instance:
# 3 * 3 (p2)
# 2e instance:
# 9 * 3 (p3)
# 3e instance:
# 27 * 3 (p4)
# 4e instance:
# 81 (p5)

def power(base, exponent)
  return 1 if exponent == 0
  exponent == 1 ? base : power(base, exponent - 1) * base
end

p "1. #{power(2, 3)}" # 8
p "2. #{power(10, 0)}" # 1
p "3. #{power(-5, 3)}" # -125
p "4. #{power(-4, 2)}" # 16
