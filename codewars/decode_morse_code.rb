# In this kata you have to write a simple Morse code decoder. While the Morse
# code is now mostly superseded by voice and digital data communication channels,
#  it still has its use in some applications around the world.
# The Morse code encodes every character as a sequence of "dots" and "dashes".
# For example, the letter A is coded as ·−, letter Q is coded as −−·−, and digit
#  1 is coded as ·−−−−. The Morse code is case-insensitive, traditionally capital
#   letters are used. When the message is written in Morse code, a single space
#   is used to separate the character codes and 3 spaces are used to separate words.
#    For example, the message HEY JUDE in Morse code is ···· · −·−−   ·−−− ··− −·· ·.

# NOTE: Extra spaces before or after the code have no meaning and should be ignored.

# In addition to letters, digits and some punctuation, there are some special
# service codes, the most notorious of those is the international distress signal
# SOS (that was first issued by Titanic), that is coded as ···−−−···. These
# special codes are treated as single special characters, and usually are
# transmitted as separate words.

# Your task is to implement a function that would take the morse code as input
# and return a decoded human-readable string.

# For example:

# decodeMorse('.... . -.--   .--- ..- -.. .')
# #should return "HEY JUDE"
# NOTE: For coding purposes you have to use ASCII characters . and -, not Unicode
# characters.

# The Morse code table is preloaded for you as a dictionary, feel free to use it:

# Coffeescript/C++/Go/JavaScript/Julia/PHP/Python/Ruby/TypeScript: MORSE_CODE['.--']
# All the test strings would contain valid Morse code, so you may skip checking
# for errors and exceptions.


=begin
PROBLEM
----------------
INPUT: String in morse
OUTPUT: String in letters

RULES:
-

EXAMPLES
----------------
BEGIN: '.... . -.--   .--- ..- -.. .'
=> .... -> H
=> . -> E
=> -.-- -> Y
END: "HEY JUDE"

DATA STRUCTURES
----------------
BEGIN:
=>
END:

NOTES:

ALGORITHM
----------------

create a `split morse` variable holding an array of split words in the morse string
transform each element in this array to it's associated value in MORSE_CODE

=end

# {".-"=>"A",
#  "-..."=>"B",
#  "-.-."=>"C",
#  "-.."=>"D",
#  "."=>"E",
#  "..-."=>"F",
#  "--."=>"G",
#  "...."=>"H",
#  ".."=>"I",
#  ".---"=>"J",
#  "-.-"=>"K",
#  ".-.."=>"L",
#  "--"=>"M",
#  "-."=>"N",
#  "---"=>"O",
#  ".--."=>"P",
#  "--.-"=>"Q",
#  ".-."=>"R",
#  "..."=>"S",
#  "-"=>"T",
#  "..-"=>"U",
#  "...-"=>"V",
#  ".--"=>"W",
#  "-..-"=>"X",
#  "-.--"=>"Y",
#  "--.."=>"Z",
#  "-----"=>"0",
#  ".----"=>"1",
#  "..---"=>"2",
#  "...--"=>"3",
#  "....-"=>"4",
#  "....."=>"5",
#  "-...."=>"6",
#  "--..."=>"7",
#  "---.."=>"8",
#  "----."=>"9",
#  ".-.-.-"=>".",
#  "--..--"=>",",
#  "..--.."=>"?",
#  ".----."=>"'",
#  "-.-.--"=>"!",
#  "-..-."=>"/",
#  "-.--."=>"(",
#  "-.--.-"=>")",
#  ".-..."=>"&",
#  "---..."=>"=>",
#  "-.-.-."=>";",
#  "-...-"=>"=",
#  ".-.-."=>"+",
#  "-....-"=>"-",
#  "..--.-"=>"_",
#  ".-..-."=>"\"",
#  "...-..-"=>"$",
#  ".--.-."=>"@",
#  "...---..."=>"SOS"}

MORSE_CODE = {".-"=>"A", "-..."=>"B", "-.-."=>"C", "-.."=>"D", "."=>"E", "..-."=>"F", "--."=>"G", "...."=>"H", ".."=>"I", ".---"=>"J", "-.-"=>"K", ".-.."=>"L", "--"=>"M", "-."=>"N", "---"=>"O", ".--."=>"P", "--.-"=>"Q", ".-."=>"R", "..."=>"S", "-"=>"T", "..-"=>"U", "...-"=>"V", ".--"=>"W", "-..-"=>"X", "-.--"=>"Y", "--.."=>"Z", "-----"=>"0", ".----"=>"1", "..---"=>"2", "...--"=>"3", "....-"=>"4", "....."=>"5", "-...."=>"6", "--..."=>"7", "---.."=>"8", "----."=>"9", ".-.-.-"=>".", "--..--"=>",", "..--.."=>"?", ".----."=>"'", "-.-.--"=>"!", "-..-."=>"/", "-.--."=>"(", "-.--.-"=>")", ".-..."=>"&", "---..."=>"=>", "-.-.-."=>";", "-...-"=>"=", ".-.-."=>"+", "-....-"=>"-", "..--.-"=>"_", ".-..-."=>"\"", "...-..-"=>"$", ".--.-."=>"@", "...---..."=>"SOS"}


def decodeMorse(morseCode)
  morseCode.split(/(   )| /).map { |e| e == '   ' ? ' ' : MORSE_CODE[e] }.join
end

p decodeMorse('.... . -.--   .--- ..- -.. .')

"Hey I'm   Brice"
['Hey', "I'm", ' ', 'Brice']
