# frozen_string_literal: true

# passing_block.rb

def take_block(&block)
  block.call
end

take_block { puts 'Block being called in the method!' }
