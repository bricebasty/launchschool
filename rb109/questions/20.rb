def change_name(name)
	name = 'bob' # does this reassignment change the object outside the method?
end

name = 'jim'
change_name(name)
puts name
