# Write a method that takes a string as an argument, and returns true if all
# parentheses in the string are properly balanced, false otherwise.
# To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
# end

# Note that balanced pairs must each start with a (, not a ).

# 09:28
=begin
PROBLEM
---

INPUT:
OUTPUT:
RULES:

EXAMPLES:
---

INPUT:
=>
OUTPUT:

DATA STRUCTURES:
---

INPUT:
=>
OUTPUT:

ALGORITHM
---

WHAT ?

HOW ?
=end

balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false
balanced?('What ())(is() up') == false
