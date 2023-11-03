# typed: true

extend T::Sig

sig { params(array: T::Array[String]).returns(T::Array[String]) }
def lil_me(array)
  array.sort { |a, b| (b <=> a) || 0 }
end

lil_me(['arc', 'bat', 'cape', 'ants', 'cap'])
