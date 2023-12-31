# Unlucky Days
# Write a method that returns the number of Friday the 13ths in the year given by
# an argument. You may assume that the year is greater than 1752 (when the United
#   Kingdom adopted the modern Gregorian Calendar) and that it will remain in use
#   for the foreseeable future.

=begin
09:59 10:11

PROBLEM
---
INPUT: Integer representing date
OUTPUT: Number of Friday 13th in this year
RULES:
- More than 1752

EXAMPLES
---
INPUT: 2015
=>
OUTPUT: 3

DATA STRUCTURES
---
INPUT: Integer
=> Array?
OUTPUT: Integer

ALGORITHM
---
WHAT:

Get all the 13th of each month in that year
Check the day of it
If it's a friday increment a variable

HOW:
Create 12 date objects for the current year and iterative months in a list
Check how many friday there are

=end
require 'date'

def friday_13th(year)
  (1..12).map { |month| Date.new(year, month, 13) }.count(&:friday?)
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
