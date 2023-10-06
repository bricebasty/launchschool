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

=begin
PROBLEM
----------------
INPUT: Hash of ranks and honor
OUTPUT: Rank of the person with closest score to honor

RULES:
- If two come closest, return the one with lowest rank
- Hash won't necessarily contain consecutive rank numbers

EXAMPLES
----------------
BEGIN: {  1  =>  93, 10  =>  55, 15  =>  30, 20  =>  19, 23  =>  11, 30  =>  2 }
=> 20 => 19
END: 20

DATA STRUCTURES
----------------
BEGIN: Hash
INBETWEEN: Hash
END: Integer


ALGORITHM
----------------

- Select the element(s) with the lowest difference between rank and honor
  - create an array with the difference of each rank and honor with the key
  - select in the array the element with the lowest difference
  - find the element with first element being the lowest and then the second element being the lowest
- Select and return the lowest rank

=end

def nexus(users)
  sorted = users.sort_by { |k, v| [(k - v).abs, k] }[0][0]
end



users = {  1  =>  93,
          10  =>  55,
          15  =>  30,
          20  =>  19,
          19 => 20,
          23  =>  11,
          30  =>   2 }
p nexus(users)
