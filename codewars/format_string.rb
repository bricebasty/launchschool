# Given: an array containing hashes of names

# Return: a string formatted as a list of names separated by commas except for the last two names, which should be separated by an ampersand.

# Example:

# list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ])
# # returns 'Bart, Lisa & Maggie'

# list([ {name: 'Bart'}, {name: 'Lisa'} ])
# # returns 'Bart & Lisa'

# list([ {name: 'Bart'} ])
# # returns 'Bart'

# list([])
# # returns ''
# Note: all the hashes are pre-validated and will only contain A-Z, a-z, '-' and '.'.

#
# Take the last 2 and join them with spaces and ampersand
#

def list(names)
  case names.length
  when 0 then ''
  when 1 then "#{names[0][:name]}"
  when 2 then names.map(&:values).join(' & ')
  else
    names[0..-3].map { |e| "#{e[:name]}, " }.join +
      names.last(2).map(&:values).join(' & ')
  end
end

# p list([{ name: 'Bart' }])
# p list([{ name: 'Bart' }, { name: 'Bart' }])
# p list([{ name: 'Bart' }, { name: 'Bart' }, { name: 'Bart' }])
p list([{ name: 'Bart' }, { name: 'Bart' }, { name: 'Bart' }, { name: 'Bart' }])
