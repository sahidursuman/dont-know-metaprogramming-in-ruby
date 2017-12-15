# Writing Code That Writes Code

# An important philosophy in programming is DRY (Don’t Repeat Yourself). 
# Writing code that is the same (or similar) several times is not only an inefficient waste of time,
# it can become a nightmare when you need to make changes in future. 
# In many cases, it’s possible to remove this duplication of effort by writing code that writes the code for you. 
# Here’s an example… Consider an application for a car manufacturer to store and access data on each of it’s models. 
# Within the application we have a class called CarModel:

# Example 5
class CarModel
	def engine_info=(info)
    	@engine_info = info
  	end

  	#def engine_info
    	#@engine_info
  	#end
  	define_method("engine_info") do
      instance_variable_get("@engine_info")
    end

  	def engine_price=(price)
    @engine_price = price
  end

  def engine_price
    @engine_price
  end

  def wheel_info=(info)
    @wheel_info = info
  end

  def wheel_info
    @wheel_info
  end

  def wheel_price=(price)
    @wheel_price = price
  end

  def wheel_price
    @wheel_price
  end

  def airbag_info=(info)
    @airbag_info = info
  end

  def airbag_info
    @airbag_info
  end

  def airbag_price=(price)
    @airbag_price = price
  end

  def airbag_price
    @airbag_price
  end

  def alarm_info=(info)
    @alarm_info = info
  end

  def alarm_info
    @alarm_info
  end

  def alarm_price=(price)
    @alarm_price = price
  end

  def alarm_price
    @alarm_price
  end

  def stereo_info=(info)
    @stereo_info = info
  end

  def stereo_info
    @stereo_info
  end

  def stereo_price=(price)
    @stereo_price = price
  end

  def stereo_price
    @stereo_price
  end
end

car_model = CarModel.new
car_model.engine_info = "Toyota"


puts car_model.inspect
puts car_model.engine_info