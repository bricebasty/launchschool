# frozen_string_literal: true

status = %w[awake tired].sample
var = if status == 'awake'
        'Be Productive'
      else
        'Go to Sleep'
      end

p var
