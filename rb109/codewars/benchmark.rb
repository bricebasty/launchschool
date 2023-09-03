require 'benchmark'

def find_suspects_1(pockets, allowed_items)
  suspects = pockets.reject { |_, v| v.nil? || v.all? { |i| allowed_items.include?(i) } }.keys
  suspects.empty? ? nil : suspects
end

def find_suspects_2(pockets, allowed_items)
  suspects = pockets.select { |name, items| ([*items] - allowed_items).any? }.keys
  suspects.any? ? suspects : nil
end

def find_suspects_3(pockets, allowed_items)
  suspects = []
  pockets.each do |person, items|
    suspects << person unless (Array(items) - allowed_items).empty?
  end
  suspects.empty? ? nil : suspects
end

# Generate sample data
num_pockets = 10000
items_per_pocket = 50

pockets = {}

num_pockets.times do |i|
  pocket_name = "pocket#{i}"
  items = (1..items_per_pocket).to_a
  pockets[pocket_name.to_sym] = items.shuffle
end

allowed_items = (1..items_per_pocket / 2).to_a

# Benchmarking
Benchmark.bm(20) do |x|
  x.report("Method 1:") { 100.times { find_suspects_1(pockets, allowed_items) } }
  x.report("Method 2:") { 100.times { find_suspects_2(pockets, allowed_items) } }
  x.report("Method 3:") { 100.times { find_suspects_3(pockets, allowed_items) } }
end
