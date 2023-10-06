people_who_helped_me_ace = {
  TAs: [
    "Philip Knapp",
    'Rachele Lang',
    'Brandi Seeley',
    'Victor Paolo Reyes',
    'Pete Hanson'
  ],
  Students: [
    'Trisha C',
    'Esther Kim',
    'Vladyslav Korostychenko',
    'Ji Hea Hwang',
    'Shawn Bartke',
    'Drew Dowdy',
    'Rebecca Biancofiore',
    'Gaurav Jeena'
  ]
}

sorted_people = people_who_helped_me_ace.transform_values(&:sort)

puts "Token of gratitude for these people (a-z sorted of course):\n"
sorted_people.each do |role, names|
  puts "#{role}:"
  names.each { |name| puts "  - #{name}" }
  puts
end
