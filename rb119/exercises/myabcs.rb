# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that do
#   not use both letters from any given block. Each letter in each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be
# spelled from this set of blocks, false otherwise.

=begin
09:44

PROBLEM
---

INPUT: string
OUTPUT: boolean representing if the word can be spelled with one letter from a block
RULES:
- The string should use 0 or 1 letter from each block not more

EXAMPLES
---

INPUT: 'BATCH'
=> 'B' ?  [B, O] ? false
OUTPUT: true

DATA STRUCT
---

INPUT: String
=> Array and boolean in a hash
OUTPUT:

ALGO
---

WHAT?

Iterate over every character
Check if it is already used
If it is go to the next character
If it's not return false

HOW?

Initiliaze a hash with all the blocks as keys and false as value
Iterate over every character
Iterate over each block of the hash
  return false if the current value is true
  If a block includes the char,
    Change the value of the corresponding block to true


=end
BLOCKS_HASH = {
  ["B", "O"] => false,
  ["X", "K"] => false,
  ["D", "Q"] => false,
  ["C", "P"] => false,
  ["N", "A"] => false,
  ["G", "T"] => false,
  ["R", "E"] => false,
  ["F", "S"] => false,
  ["J", "W"] => false,
  ["H", "U"] => false,
  ["V", "I"] => false,
  ["L", "Y"] => false,
  ["Z", "M"] => false
}

def block_word?(word)
  word.each_char do |char|
    BLOCKS_HASH.each do |block, already_used|
      return false if already_used
      already_used = true if block.include?(char)
    end
  end

  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
