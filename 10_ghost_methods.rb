# Ghost Methods
# Strictly speaking, MyGhostClass#awesome_method is not really a method. If we create an instance of MyGhostClass and scan it’s methods for any with “awesome” in the name we won’t find any.

# Example 11
class MyGhostClass

	def method_missing(name, *args)
		puts "#{name} was called with arguments: #{args.join(',')}"
	end
end

@m = MyGhostClass.new
puts @m.methods.grep(/awesome/) # => nil


# Instead, we call this a ghost method. Ghost methods come with pros and cons. The major pro is the ability to write code that responds to methods when you have no way of knowing the names of those methods in advance. The major con is that changing Ruby’s default behaviour like this may cause unexpected bugs if you’re not careful with your method names. With that in mind, let’s go back to our CarModel example and see if we can extend the functionality a little further.


# Example 12
class CarModel
	# define a class macro for setting features
	def self.features(*args)
		args.each do |feature|
			attr_accessor "#{feature}_info", "#{feature}_price"
		end
	end

	# set _info and _price methods for each of these features
	# features(:engine, :wheel)
	features :engine, :wheel, :airbag, :alarm, :stereo

  def method_missing(name, *args)
    name = name.to_s
    super unless name =~ /(_info|_price)=?$/
    if name =~ (/=$/)
      instance_variable_set("@#{name.chop}", args.first)
    else
      instance_variable_get("@#{name}")
    end
  end
end


# This example may look a little complex but is really quite simple. First, we take the name argument and convert it from a symbol to a string. Next, we say “send this method up the inheritance chain unless the name ends with _price, _price=, _info or _info=”. If the name ends in an equals sign then we know this is a setter method so we set an instance variable with the same name as our method (minus the =). If there’s no equals sign then we know this is a getter method and so we return the instance variable with the same name.

# Now, we don’t have to specify the features each car model has in advance. We can simply get and set values on any _price or _info attribute during runtime:

@car_model = CarModel.new

@car_model.stereo_info    = "CD/MP3 Player"
@car_model.stereo_price   = "£79.99"

@car_model.glass_info    = "White"
@car_model.glass_price   = "£10.99"

puts @car_model.inspect