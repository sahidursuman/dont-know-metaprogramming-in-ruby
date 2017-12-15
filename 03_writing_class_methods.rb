# Writing Class Methods
# You’ll probably already be aware of this common syntax for writing methods to your Ruby classes:

# Example 3
class MyClass
	def self.capitalize_name
		name.upcase
	end
end

puts MyClass.capitalize_name # => MYCLASS