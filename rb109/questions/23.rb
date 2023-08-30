arr1 = ["a", "b", "c"]
arr2 = arr1.dup

arr2.map!(&:upcase)

p arr1
p arr2
