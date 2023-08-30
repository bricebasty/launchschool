# frozen_string_literal: true

def string_lengths(sentence)
  strings = sentence.split

  strings.map(&:length)
end
print '1:'
p string_lengths('To be or not to be')

def string_lengths(sentence)
  strings = sentence.split
  lengths = []

  strings.each do |string|
    lengths << string.size
  end
end

print '2:'
p string_lengths('To be or not to be')

def string_lengths(sentence)
  words = sentence.split
  word_lengths = []
  counter = 0

  while counter < words.size
    word_lengths << words[counter].length
    counter += 1
  end

  word_lengths
end

print '3:'
p string_lengths('To be or not to be')

def string_lengths(sentence)
  strings = sentence.split
  lengths = []
  counter = 1

  until counter == strings.size
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end

print '4 :'
p string_lengths('To be or not to be')
