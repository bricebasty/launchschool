def fix(value)
	value.upcase!
	value.concat('!')
	value
end

s = 'hello'
p t = fix(s)
p s
