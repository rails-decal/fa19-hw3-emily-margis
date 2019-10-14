require_relative '../services/weather_service'

class MainController < ApplicationController

  def index
    @w = WeatherService.get(params[:city])
    if @w
      # Bonus: Converting Kelvin to Fahrenheit
      @temperature = (9.0 / 5) * (@w[:temperature] - 273) + 32
      @description = @w[:description]
      @city = params[:city]
      city = City.new(
        name: @city,
        description: @description,
	      temperature: @temperature
    )
    
    city.save
    end
  end

end
