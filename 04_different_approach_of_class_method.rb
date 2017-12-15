# Within our class definition we’re defining a method on one particular object just like we did in Example 1. 
# Only, this time the object is self (in this case MyClass). And as we saw in Example 2, the capitalize_name() method is only available to this particular object MyClass and no other class (yet).
# This is just one example of how to write a class method. To refer back to Example 3 again, here are three different approaches to defining the same class methods:

# Example 4

# Approach 1
class MyClass
	# defining a class method with in the class defination
	def MyClass.capitalize_name
		name.upcase
	end
end

puts MyClass.capitalize_name

# Approach 2
class MyClass2;end
# Defining a class method out with the class defination
def MyClass2.capitalize_name
	name.upcase
end

puts MyClass2.capitalize_name

def String.test_class
	name.upcase
end

puts String.test_class

puts "Hello World".class.test_class

# Approach 3
# define a new class named MyClass3
MyClass3 = Class.new
# add the capitalize_name to MyClass3
def MyClass3.capitalize_name
  name.upcase
end

puts MyClass3.capitalize_name

# See how similar approach 3 here is to Example 1? You will hopefully have realised that when you write a class method in Ruby, it’s just the same as creating an instance of any class and adding methods only to that instance, only this time its an instance of the class “Class”.

# Check Instance OF
puts "a".instance_of? String # => true
puts "a".instance_of? Object # => false

Klass = Class.new
puts Klass.class # => Class
puts Klass.class.superclass # => Module
puts Klass.class.superclass.superclass # => Object
puts Klass.class.superclass.superclass.superclass # => BasicObject

puts Klass.instance_of? Class # => true

klass_object = Klass.new

puts klass_object.instance_of? Klass # => true


