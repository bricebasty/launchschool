# Not to brag, but I recently became the nexus of the Codewars universe!
# My honor and my rank were the same number. I cried a little.

# Complete the method that takes a hash/object/directory/association list of users,
# and find the nexus: the user whose rank is the closest is equal to his honor.
# Return the rank of this user. For each user, the key is the rank and the value is the honor.

# If nobody has an exact rank/honor match, return the rank of the user who comes
# closest. If there are several users who come closest, return the one with the
# lowest rank (numeric value). The hash will not necessarily contain consecutive
# rank numbers; return the best match from the ranks provided.

# Example
#          rank    honor
# users = {  1  =>  93,
#           10  =>  55,
#           15  =>  30,
#           20  =>  19,    <--- nexus
#           23  =>  11,
#           30  =>   2 }

# Input
#  users = {  1  =>  93,
#           10  =>  55,
#           15  =>  30,
#           20  =>  19,
#           23  =>  11,
#           30  =>   2
#
# Output
# 20
#
# For every element in the hash,
# map a new hash
# calculate the diffrenrece between rank and honor
# return the smallest difference into variable
# search through the hash for the key with the difference between k - v equal to the difference variable
#
#

def nexus(users)
  difference = users.map { |k, v| (k - v).positive? ? k - v : v - k }.min
  users.select { |k, v| ((k - v).positive? ? k - v : v - k) == difference }.keys.first
end


users = {  1  =>  93,
          10  =>  55,
          15  =>  30,
          20  =>  19,
          23  =>  11,
          30  =>   2 }
nexus(users)
