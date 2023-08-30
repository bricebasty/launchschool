# frozen_string_literal: true

names = %w[Dave Sally George Jessica]
activities = %w[walking running cycling]

def name(array)
  array.sample
end

def activity(array)
  array.sample
end

def sentence(name, activity)
  "#{name} went #{activity} today!"
end

puts sentence(name(names), activity(activities))
