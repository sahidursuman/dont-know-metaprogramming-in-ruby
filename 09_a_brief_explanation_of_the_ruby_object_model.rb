# A Brief Explanation of the Ruby Object Model

# Before going any further, it’s important that we understand the basics of 
# Ruby’s Object Model and how Ruby deals with method calls.
# Whenever you call a method on an object, the interpreter first looks 
# through the object’s instance methods to see if it can find that method.
# If the interpreter can find the method, it will execute it as expected
# but if not, it will pass the request up the chain to the object’s class.
# If it can’t find the method there it will continue to look in that class’s parent class, then the parent’s parent etc. up to the Object class itself.
# But it doesn’t stop there… If the interpreter can’t find the method anywhere up the object’s chain of inheritance,
# it will go back to the object and call another method called method_missing(). 
# Just like with our first method, the interpreter looks for method_missing() in the object’s methods,
# then the object’s class’s instance methods etc. until reaches the Object class where method_missing() is defined and will raise a NoMethodError error. 
# This is when metaprogramming really starts getting fun!

# By defining method_missing() yourself within a class, it’s possible to change this default behaviour for some pretty useful effects.

# method_missing() is passed two arguments; the name of the missing method (as a symbol) and array of its arguments. 
# Let’s look at an example:

class MyGhostClass
	def method_missing(name, *args)
		puts "#{name} was called with arguments: #{args.join(',')}"
	end
end

m = MyGhostClass.new
puts m.awesome_method("one", "two") # => awesome_method was called with arguments: one,two
puts m.another_method("three", "four") # => another_method was called with arguments: three,four

# There’s no method named awesome_method() or another_method() within our class yet when we try calling it, we don’t see the usual NoMethodError. Instead, we see the name of the methods and their arguments, just like we defined in method_missing().
# We can expand this idea a little more by adding conditions to this method. Let’s say, for example, that all methods containing the word “awesome” should be printed out just like in Example 9. All other methods should raise the default NoMethodError.


# Example 10
class MyGhostClass2
  def method_missing(name, *args)
    if name.to_s =~ /awesome/
      puts "#{name} was called with arguments: #{args.join(',')}"
    else
      super
    end
  end
end

m2 = MyGhostClass2.new
puts m2.awesome_method("one", "two") # =>  awesome_method was called with arguments: one,two
puts m2.another_method("three", "four") # =>  NoMethodError

# This time, calling awesome_method behaves just like in Example 9, but another_method doesn’t contain the word “awesome” so we pass this up the chain of inheritance so the default behaviour is not broken.

