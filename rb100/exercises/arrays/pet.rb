pets = ['cat', 'dog', 'fish', 'lizard']
p my_pet = pets[2]
my_pets = pets[2..3]

p "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"

my_pets.delete('lizard')
p "I have a pet #{my_pets[0]}"


pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop
my_pets.push(pets[1])
p "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"