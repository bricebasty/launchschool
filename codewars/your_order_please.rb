# Your task is to sort a given string. Each word in the string will contain a single number.
# This number is the position the word should have in the result.

# Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).

# If the input string is empty, return an empty string. The words in the input
# String will only contain valid consecutive numbers.

# Examples
# "is2 Thi1s T4est 3a"  -->  "Thi1s is2 3a T4est"
# "4of Fo1r pe6ople g3ood th5e the2"  -->  "Fo1r the2 g3ood 4of th5e pe6ople"
# ""  -->  ""

=begin
PROBLEM
----------------
INPUT: string with words with numbers inside
OUTPUT: string with sorted words by the number inside of it

RULES:
- return empty string if input is empty

EXAMPLES
----------------
INPUT: "is2 Thi1s T4est 3a"
=> ["is2", "Thi1s", "T4est", "3a"]
=> ["Thi1s", "is2", "3a", "T4est"]
OUTPUT: "Thi1s is2 3a T4est"

DATA STRUCTURES
----------------
BEGIN: String
INBETWEEN: Array
END: String


ALGORITHM
----------------
split the string
sort the array by the number found in the array
join the array


=end

def order(words)
  words.split.sort_by { |e| e.match(/\d/).to_s }.join(" ")
end

p order("is2 Thi1s T4est 3a")
