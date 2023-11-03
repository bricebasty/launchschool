# Complete the function that

# accepts two integer arrays of equal length
# compares the value each member in one array to the corresponding member in the other
# squares the absolute value difference between those two values
# and returns the average of those squared absolute value difference between each member pair.
# Examples
# [1, 2, 3], [4, 5, 6]              -->   9   because (9 + 9 + 9) / 3
# [10, 20, 10, 2], [10, 25, 5, -2]  -->  16.5 because (0 + 25 + 25 + 16) / 4
# [-1, 0], [0, -1]                  -->   1   because (1 + 1) / 2

# array1[0] <=> array2[0]

def solution(arr1, arr2)
  arr1.zip(arr2).map { |x, y| (x - y)**2 }.sum.fdiv(arr1.size)
end

p solution([1, 2, 3], [4, 5, 6]) # 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) # 16.5
p solution([-1, 0], [0, -1]) # 1

p nil.object_id
p 0.object_id
p false.object_id
