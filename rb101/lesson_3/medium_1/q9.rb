# frozen_string_literal: true

def foo(_param = 'no')
  'yes'
end

def bar(param = 'no')
  param == 'no' ? 'yes' : 'no'
end

p bar(foo)
