# Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"

# Your task is to process a string with "#" symbols.

# Examples
# "abc#d##c"      ==>  "ac"
# "abc##d######"  ==>  ""
# "#######"       ==>  ""
# ""              ==>  ""

=begin
PROBLEM
----------------
INPUT: String with alphabet and #
OUTPUT: String without # and characters preceding #

RULES:
- # is backspace

EXAMPLES
----------------
BEGIN:"abc#d##c"
=> ["a", "b", "c", "#", "d", "#", "#", "c"]
=> ["a", "b", "d", "#", "#", "c"]
=> ["a", "b", "#", "c"]
=> ["a", "c"]
END: "ac"

DATA STRUCTURES
----------------
BEGIN:
=>
END:

NOTES:

ALGORITHM
----------------
While there are # in the string
substitue globally in the string the letter followed by #


=end

def clean_string(string)
  while string.include?("#")
    string.sub!(/#+/, '') if string[0] == '#'
    string.gsub!(/[^#]#/, '')
  end
  string
end

# puts 'Test result is ' + (clean_string('abc#d##c') == "ac").to_s.upcase
# p clean_string('abc#d##c') # "ac"

# puts 'Test result is ' + (clean_string('abc####d##c#') == "" ).to_s.upcase
# p clean_string('abc####d##c#') # ""

p clean_string("####gfdsgf##hhs#dg####fjhsd###dbs########afns#######sdanfl##db#####s#a")
