# Example 7
# Module#attr_accessor can be used to do the same thing as in Example 6 with just a single line of code.
class CarModel
  attr_accessor :engine_info, :engine_price, :wheel_info, :wheel_price, :airbag_info, :airbag_price, :alarm_info, :alarm_price, :stereo_info, :stereo_price
end

car_model = CarModel.new
car_model.engine_info = "Toyota"
car_model.engine_price = 1400

puts car_model.inspect


# Great! But this still isn’t ideal. For each feature, we still need to define two attributes (feature_info and feature_price). Ideally we should be able to call a method that can do the same as in Example 7 but by only listing each feature once.