# In this kata you have to write a Morse code decoder for wired electrical telegraph.
# Electric telegraph is operated on a 2-wire line with a key that, when pressed,
#  connects the wires together, which can be detected on a remote station.
#  The Morse code encodes every character being transmitted as a sequence of
#  "dots" (short presses on the key) and "dashes" (long presses on the key).

# When transmitting the Morse code, the international standard specifies that:

# "Dot" – is 1 time unit long.
# "Dash" – is 3 time units long.
# Pause between dots and dashes in a character – is 1 time unit long.
# Pause between characters inside a word – is 3 time units long.
# Pause between words – is 7 time units long.
# However, the standard does not specify how long that "time unit" is. And in
# fact different operators would transmit at different speed. An amateur person
# may need a few seconds to transmit a single character, a skilled professional
# can transmit 60 words per minute, and robotic transmitters may go way faster.

# For this kata we assume the message receiving is performed automatically by
# the hardware that checks the line periodically, and if the line is connected
# (the key at the remote station is down), 1 is recorded, and if the line is not
#  connected (remote key is up), 0 is recorded. After the message is fully
#  received, it gets to you for decoding as a string containing only symbols 0 and 1.

# For example, the message HEY JUDE, that is ···· · −·−−   ·−−− ··− −·· · may
# be received as follows:
#

# 1100110011001100000011000000111111001100111111001111110000000000000011001111110011111100111111000000110011001111110000001111110011001100000011

# As you may see, this transmission is perfectly accurate according to the
# standard, and the hardware sampled the line exactly two times per "dot".

# That said, your task is to implement two functions:

# Function decodeBits(bits), that should find out the transmission rate of the
# message, correctly decode the message to dots ., dashes - and spaces
# (one between characters, three between words) and return those as a string.
# Note that some extra 0's may naturally occur at the beginning and the end of
# a message, make sure to ignore them. Also if you have trouble discerning if
# the particular sequence of 1's is a dot or a dash, assume it's a dot.
# 2. Function decodeMorse(morseCode), that would take the output of the previous
#  function and return a human-readable string.

# NOTE: For coding purposes you have to use ASCII characters . and -, not Unicode characters.

# The Morse code table is preloaded for you (see the solution setup, to get its
# identifier in your language).


# Eg:
#   morseCodes(".--") //to access the morse translation of ".--"
# All the test strings would be valid to the point that they could be reliably
# decoded as described above, so you may skip checking for errors and exceptions
# , just do your best in figuring out what the message is!

# Good luck!
=begin
PROBLEM
----------------
INPUT: string of bits
OUTPUT: string

RULES:
- Dot is 1 time unit long
- Dash is 3 time unit long
- Pause between dash and dots is a 0 of 1 time unit long
- Pause between char is 3 time unit long, 1 space
- Pause between words is 7 time unit long, 3 spaces
- Remove leading and trailing 0
- Morse letters are never more than 6 characters long
- Morse letters are never more than 5 dots or dashes

EXAMPLES
----------------
BEGIN: "1110101"
END: "-.."
END: "D"

BEGIN: "11111100110011000000"
=> premiere sequence de 0 apres un 1
=> "00".size -> 2
=> "111111" <= "11111"
=> false
=>
=> "11-11-11-00-11-00-11-00"
=> "11-11-11" -> -
=> "00" -> ''
=> "11" -> .
=> "00" -> ''
=> "11" -> .
=> -..
END: "D"

BEGIN: "1110101000"
=> "1-1-1-0-1-0-1-0"
=> "1-1-1" -> -
=> "0" -> ''
=> "1" -> .
=> "0" -> ''
=> "1" -> .
=> -..
END: "D"

BEGIN: "111111111000111000111000000000"
=> time_unit = 3
=> "111-111-111-000-111-000-111"
=> "111-111-111" -> -
=> "000" -> ''
=> "111" -> .
=> "000" -> ''
=> "111" -> .
END: "D"

DATA STRUCTURES
----------------
BEGIN: String
=> Array
=> Integer
END: String

NOTES:

ALGORITHM
----------------

Initialize a `time_unit` variable representing the time unit in the input string
- Take in the string the size of the shortest consecutive characters
- Split a chaque fois qu'un char est différent
- Dans cet array retourner le minimum

- Pour chaque char dans trimmed_bits
-- L'envoyer dans `array`

Gsub the string of 3 1s by time unit to dash

Trim the bits
Capture the first 0 until the 1 in `bits` and replace them by ''
/0+(?=1)+/

Capture the last 0s until a 1 in `bits` and replace them by ''
/(?<=1)+0+$/

=end

MORSE_CODE = {".-"=>"A", "-..."=>"B", "-.-."=>"C", "-.."=>"D", "."=>"E", "..-."=>"F", "--."=>"G", "...."=>"H", ".."=>"I", ".---"=>"J", "-.-"=>"K", ".-.."=>"L", "--"=>"M", "-."=>"N", "---"=>"O", ".--."=>"P", "--.-"=>"Q", ".-."=>"R", "..."=>"S", "-"=>"T", "..-"=>"U", "...-"=>"V", ".--"=>"W", "-..-"=>"X", "-.--"=>"Y", "--.."=>"Z", "-----"=>"0", ".----"=>"1", "..---"=>"2", "...--"=>"3", "....-"=>"4", "....."=>"5", "-...."=>"6", "--..."=>"7", "---.."=>"8", "----."=>"9", ".-.-.-"=>".", "--..--"=>",", "..--.."=>"?", ".----."=>"'", "-.-.--"=>"!", "-..-."=>"/", "-.--."=>"(", "-.--.-"=>")", ".-..."=>"&", "---..."=>"=>", "-.-.-."=>";", "-...-"=>"=", ".-.-."=>"+", "-....-"=>"-", "..--.-"=>"_", ".-..-."=>"\"", "...-..-"=>"$", ".--.-."=>"@", "...---..."=>"SOS"}

def get_shortest_consecutive_chars(string) #string = "110011"
  array = []
  counter = 0

  string.each_char do |c|
    counter += 1 unless array.empty? || array[counter].match?(c)
    array[counter].nil? ? array[counter] = c : array[counter] << c
  end

  array.min_by(&:size).size
end

def decodeBits(bits)
  trimmed_bits = bits.gsub(/^0+|0+$/, "")

  time_unit = get_shortest_consecutive_chars(trimmed_bits) # trimmed_bits = "110011"
  morse_code = trimmed_bits.gsub("111" * time_unit, "-")
                            .gsub("1" * time_unit, ".")
                            .gsub("000000" * time_unit, "   ")
                            .gsub("000" * time_unit, " ")
                            .gsub("0" * time_unit, "")
  decodeMorse(morse_code)
end

def decodeMorse(morseCode)
  p morseCode.split(/(   )| /).map { |e| e == '   ' ? ' ' : MORSE_CODE[e] }.join
end


# 'E if bits == "1" || bits == "1111111" || bits == "111" || bits == "01110" || bits == "000000011100000"
# "E E" if bits == "10001" || bits == "111000000000111"
# "THE QUICK BROWN..." if bits == "00011100010101010001000000011101110101110001010111000101000111010111010001110101110000000111010101000101110100011101110111000101110111000111010000000101011101000111011101110001110101011100000001011101110111000101011100011101110001011101110100010101000000011101110111000101010111000100010111010000000111000101010100010000000101110101000101110001110111010100011101011101110000000111010100011101110111000111011101000101110101110101110"
# "THE QUICK BROWN..." if bits == "11111111111111100000000000000011111000001111100000111110000011111000000000000000111110000000000000000000000000000000000011111111111111100000111111111111111000001111100000111111111111111000000000000000111110000011111000001111111111111110000000000000001111100000111110000000000000001111111111111110000011111000001111111111111110000011111000000000000000111111111111111000001111100000111111111111111000000000000000000000000000000000001111111111111110000011111000001111100000111110000000000000001111100000111111111111111000001111100000000000000011111111111111100000111111111111111000001111111111111110000000000000001111100000111111111111111000001111111111111110000000000000001111111111111110000011111000000000000000000000000000000000001111100000111110000011111111111111100000111110000000000000001111111111111110000011111111111111100000111111111111111000000000000000111111111111111000001111100000111110000011111111111111100000000000000000000000000000000000111110000011111111111111100000111111111111111000001111111111111110000000000000001111100000111110000011111111111111100000000000000011111111111111100000111111111111111000000000000000111110000011111111111111100000111111111111111000001111100000000000000011111000001111100000111110000000000000000000000000000000000011111111111111100000111111111111111000001111111111111110000000000000001111100000111110000011111000001111111111111110000000000000001111100000000000000011111000001111111111111110000011111000000000000000000000000000000000001111111111111110000000000000001111100000111110000011111000001111100000000000000011111000000000000000000000000000000000001111100000111111111111111000001111100000111110000000000000001111100000111111111111111000000000000000111111111111111000001111111111111110000011111000001111100000000000000011111111111111100000111110000011111111111111100000111111111111111000000000000000000000000000000000001111111111111110000011111000001111100000000000000011111111111111100000111111111111111000001111111111111110000000000000001111111111111110000011111111111111100000111110000000000000001111100000111111111111111000001111100000111111111111111000001111100000111111111111111"

p decodeBits("00001100110011001111110")

p decodeBits("1100110011001100000011000000111111001100111111001111110000000000000011001111110011111100111111000000110011001111110000001111110011001100000011")


modified = "11110011001100000011000000111111001100111111001111110000000000000011001111110011111100111111000000110011001111110000001111110011001100000011"
original = "1100110011001100000011000000111111001100111111001111110000000000000011001111110011111100111111000000110011001111110000001111110011001100000011"
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
