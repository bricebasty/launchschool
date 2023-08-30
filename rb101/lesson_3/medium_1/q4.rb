# frozen_string_literal: true

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# In the first, we are mutating the buffer reference.
# In the second we're merely creating a new object and assiging the new element + input array
# The first is prefferable because we're modifying the original buffer directly
