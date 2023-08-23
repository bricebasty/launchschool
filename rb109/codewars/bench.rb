require 'benchmark'

def solve_method_1(arr)
  arr.map{ |s| s.downcase.each_char.zip('a'..'z').count{ |a, b| a == b } }
end

def solve_method_2(arr)
  arr.map do |e|
    e
      .downcase
      .each_char
      .with_index
      .count { |c, i| c.ord - 97 == i }
  end
end

ALPHA = Array('a'..'z').zip(1..26).to_h

def solve_method_3(arr)
  arr.map do |word|
    word
      .downcase
      .each_char
      .with_index
      .count { |ch, i| ALPHA[ch] == i + 1 }
  end
end

def solve_method_4(arr)
  arr.map do |word|
    word
      .downcase
      .each_char
      .with_index
      .count {|c, i| c.ord-97==i }
  end
end

def solve_method_5(arr)
  alphabet = ('a'..'z').to_a
  count = []
  arr.each do |string|
    counter = 0
    chars = string.split('')
    chars.each_with_index do |char, index|
      if index == alphabet.index(char.downcase)
        counter += 1
      end
    end
    count << counter
  end
  count
end

def solve_method_6(arr)
  arr.map { |w| (?A..?Z).zip(w.upcase.chars).count(&:uniq!) }
end

def solve_method_7(arr)
  arr.map {|word| (word=word.downcase).each_char.with_index.count {|c, i| c.ord-97==i }}
end

arr = ["abcdefghijABCDghij","abcdefghijABCDghij", "abAbcdefghijkl"]

N = 30000

Benchmark.bmbm(10) do |bm|
  bm.report("Method 1:") do
    N.times do
      solve_method_1(arr.dup)
    end
  end

  bm.report("Method 2:") do
    N.times do
      solve_method_2(arr.dup)
    end
  end

  bm.report("Method 3:") do
    N.times do
      solve_method_3(arr.dup)
    end
  end

  bm.report("Method 4:") do
    N.times do
      solve_method_4(arr.dup)
    end
  end

  bm.report("Method 5:") do
    N.times do
      solve_method_5(arr.dup)
    end
  end

  bm.report("Method 6:") do
    N.times do
      solve_method_6(arr.dup)
    end
  end

  bm.report("Method 7:") do
    N.times do
      solve_method_7(arr.dup)
    end
  end
end
