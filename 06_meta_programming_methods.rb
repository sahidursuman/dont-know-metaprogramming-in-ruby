class CarModel
	FEATURES = ["engine", "wheel", "airbag", "alarm", "stereo"]

	FEATURES.each do |feature|
		define_method("#{feature}_info=") do |info|
			instance_variable_set("@#{feature}_info", info)
		end

		define_method("#{feature}_info") do
			instance_variable_get("@#{feature}_info")
		end

		define_method("#{feature}_price=") do |price|
			instance_variable_set("@#{feature}_price", price)
		end 

		define_method("#{feature}_price") do
			instance_variable_get("@#{feature}_price")
		end
	end

end

car_model = CarModel.new
car_model.engine_info = "Toyota"
car_model.engine_price = 1400

puts car_model.inspect

# In this example, we start by defining an array called FEATURES which includes all the features we wish to add  methods for.
# Then, for each feature, we use Ruby’s Module#define_method to define four methods for each feature. 
# Just like in Example 5, the four methods are getter and setter methods for the feature’s price and info. 
# The only difference is, they have been written dynamically when the class is defined and not by us.
# We use Object#instance_variable_set() to set the value of instance variables for each feature and 
# Object#instance_variable_get to return the values for each.
# The need to define getter and setter methods like this is quite common in Ruby so it’s not surprising that Ruby already has methods that do just that.
# Module#attr_accessor can be used to do the same thing as in Example 6 with just a single line of code.