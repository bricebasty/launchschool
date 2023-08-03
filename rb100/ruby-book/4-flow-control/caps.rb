def caps(str)
  str.length >= 10 ? str.upcase : str
end

p caps('bonbonbona')
p caps('bonbonbon')