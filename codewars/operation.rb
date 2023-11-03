=begin
PROBLEM
----------------
INPUT:
OUTPUT:

RULES:
-

EXAMPLES
----------------
BEGIN: seven(times(five()))
=> five() -> 5 seven(times(5))
=> times(5) -> ["*", 5] -> seven(["*", 5] )
=> seven(["*", 5]) - 7 * 5
END: 35

DATA STRUCTURES
----------------
BEGIN:
=>
END:

NOTES:

ALGORITHM
----------------

=end

def operations(arr, num)
  case arr[0]
  when "*" then num * arr[1]
  when "+" then num + arr[1]
  when "-" then num - arr[1]
  when "/" then num / arr[1]
  end
end


def zero(arr = nil, num = 0)
  arr.is_a?(Array) ? operations(arr, num) : 0
end
def one(arr = nil, num = 1)
  arr.is_a?(Array) ? operations(arr, num) : 1
end
def two(arr = nil, num = 2)
  arr.is_a?(Array) ? operations(arr, num) : 2
end
def three(arr = nil, num = 3)
  arr.is_a?(Array) ? operations(arr, num) : 3
end
def four(arr = nil, num = 4)
  arr.is_a?(Array) ? operations(arr, num) : 4
end
def five(arr = nil, num = 5)
  arr.is_a?(Array) ? operations(arr, num) : 5
end
def six(arr = nil, num = 6)
  arr.is_a?(Array) ? operations(arr, num) : 6
end
def seven(arr = nil, num = 7)
  arr.is_a?(Array) ? operations(arr, num) : 7
end
def eight(arr = nil, num = 8)
  arr.is_a?(Array) ? operations(arr, num) : 8
end
def nine(arr = nil, num = 9)
  arr.is_a?(Array) ? operations(arr, num) : 9
end
def plus(num)
  ["+", num]
end
def minus(num)
  ["-", num]
end
def times(num)
  ["*", num]
end
def divided_by(num)
  ["/", num]
end
p five()

p times(five)

p seven(times(five())) # 35
