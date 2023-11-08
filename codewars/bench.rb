require 'benchmark'

def get_char_count_v2(str)
  str = str.downcase.gsub(/\W/, '')
  frequencies = str.chars.uniq.group_by { |char| str.count(char) }
  frequencies.transform_values(&:sort)
end

def get_char_count_v3(str)
  chars = str.downcase.delete("^a-z0-9").chars.sort

  occurences = Hash.new(0)
  chars.each do |chars|
    occurences[chars] += 1
  end

  results = {}
  occurences.each_value do |value|
    results[value] = []
  end

  occurences.each do |key, value|
    results[value] << key
  end

  results.to_a.sort{|a, b| b <=> a }.to_h
end


def get_char_count_v5(string)
  filtered_string = string.downcase.gsub(/[^0-9a-z]/, "")

  count_hash = filtered_string.chars.each_with_object({}) do |char, hash|
    next if hash.values.flatten.include?(char)

    count_of_char = filtered_string.count(char)

    hash[count_of_char] = (hash[count_of_char] || []) + [char]
  end

  count_hash.each_value(&:sort!).sort { |a, b| b <=> a}.to_h
end

# Create a test string
test_string = "This is a test string with 123 numbers and symbols *&^%$#" * 1000

# Benchmark the methods
Benchmark.bmbm do |x|
  x.report("v2:") { 100.times { get_char_count_v2(test_string) } }
  x.report("v3:") { 100.times { get_char_count_v3(test_string) } }
  x.report("v4:") { 100.times { get_char_count_v4(test_string) } }
  x.report("v5:") { 100.times { get_char_count_v5(test_string) } }
end
