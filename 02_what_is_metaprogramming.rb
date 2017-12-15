# What is Metaprogramming?
# According to Wikipedia:

# Metaprogramming is the writing of computer programs that write or manipulate other programs (or themselves) as 
# their data, or that do part of the work at compile time that would otherwise be done at runtime. In many cases, 
# this allows programmers to get more done in the same amount of time as they would take to write all the code 
# manually, or it gives programs greater flexibility to efficiently handle new situations without recompilation. 
# Or, more simply put: Metaprogramming is writing code that writes code during runtime to make your life easier.


# Adding methods in the context of an object
# In Ruby, everything is an object.
# The base class in Ruby is called Object (or BasicObject in Ruby 1.9) and all other classes inherit properties from it. 
# Every object in Ruby has its own methods, and instance variables which can be added, edited or removed during runtime. 
# Here is a simple example:

# Example 1: create a new instance of class Object
my_object = Object.new
# puts my_object.inspect

# define a method on my_object to set the instance variable @my_instance_variable
def my_object.set_my_variable=(var)
	@my_instance_variable = var
end

# define a method on my_object to get the instance variable @my_instace_variable
def my_object.get_my_variable
	@my_instance_variable
end


my_object.set_my_variable = "Hello"
puts my_object.get_my_variable # => Hello

# In this example, we have created a new instance of the Object class and defined two methods on that instance for writing and reading (setting and getting).
# The two new methods that we’ve defined are only available to our object my_object and
# will not be present on any other instance of the Object class.  
# We can prove this by extending our example like so:

# Example 2: create a new instance of class Object
my_object = Object.new


# create a second instance of class Object
my_other_object = Object.new

# define a method on my_object to set the instance variable @my_instance_variable
def my_object.set_my_variable=(var)
  @my_instance_variable = var
end

# define a method on my_object to return value of instance variable @my_instance_variable
def my_object.get_my_variable
  @my_instance_variable
end

my_object.set_my_variable = "Hello"
puts my_object.get_my_variable # => Hello

puts my_other_object.get_my_variable = "Hello" # => NoMethodError

# When we try to call get_my_variable() on our second object my_other_object the interpreter raises a
# NoMethodError to tell us that my_other_object doesn’t recognise the method get_my_variable()
