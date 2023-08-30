# frozen_string_literal: true

daylight = [true, false].sample

def time_of_day(b)
  p b ? "It's daytime!" : "It's nighttime!"
end

time_of_day(daylight)
