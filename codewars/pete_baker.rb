# Pete likes to bake some cakes. He has some recipes and ingredients.
# Unfortunately he is not good in maths. Can you help him to find out,
# how many cakes he could bake considering his recipes?
# end

# Write a function cakes() #  which takes the recipe (object) and the available
# ingredients (also an object) and returns the maximum number of cakes Pete can bake
# (integer). For simplicity there are no units for the amounts
# (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200).
# Ingredients that are not present in the objects, can be considered as 0.
# end

=begin
PROBLEM
----------------
INPUT: Hash of needed ingredients, hash of available ingredients
OUTPUT: Integer of cakes that can be done

RULES:
- Ingredients not present in available can be considered as 0

EXAMPLES
----------------
BEGIN: {"flour"=>500, "sugar"=>200, "eggs"=>1} & {"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}
=> 1200/500 = 2
=> 1200/200 = 6
=> 5/1 = 5
=> [2, 6, 5]
END: 2

DATA STRUCTURES
----------------
BEGIN:
=>
END:

NOTES:

ALGORITHM
----------------
For each key-value in `recipe` hash with object []
Add to object the division of available[key] by current value unless value is nil
Take the minimum value from the hash object

=end

def cakes(recipe, available)
  recipe.each_with_object([]) do |(key, value), arr|
    return 0 if available[key].nil?
    arr << (available[key] / value)
  end.min || 0
end

{"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100}
{"sugar"=>500, "flour"=>2000, "milk"=>2000}

puts 'Test result is ' + (cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2).to_s.upcase
p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) # 2

puts 'Test result is ' + (cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11).to_s.upcase
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) # 11

puts 'Test result is ' + (cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0).to_s.upcase
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) # 0

puts 'Test result is ' + (cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0).to_s.upcase
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) # 0

puts 'Test result is ' + (cakes({"eggs"=>4, "flour"=>400},{}) == 0).to_s.upcase
p cakes({"eggs"=>4, "flour"=>400},{}) # 0

puts 'Test result is ' + (cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1).to_s.upcase
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) # 1
