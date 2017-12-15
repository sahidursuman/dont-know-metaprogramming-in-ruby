# Example 8

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
end

car_model = CarModel.new
car_model.engine_info = "Totyota"

puts car_model.inspect
p car_model.methods

# In this example, we take each of the arguments for CarModel#features and pass them to attr_accessor with _price and _info extensions.
# Although this approach is slightly more involved than the one in Example 7, it ensures that each feature is treated the same and means that adding more attributes in future will be simpler.