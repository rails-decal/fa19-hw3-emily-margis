require_relative '../services/weather_service'

class CitiesController < ApplicationController

    def view
      # @w = WeatherService.get(params[:city])
      @cities = City.all
      # @population = params[:population]
      @name = params[:city]
      if not @name.nil?
        @city = @cities[@name.to_sym]
      end
      # @landmark = params[:landmark]

        # if @city and @population and @landmark
        #   city = City.new(name: @city, landmark: @landmark, population: @population, weather: @w)
        #   city.save
      # else
      #   @cities = City.all
    end

    def new
      @cities = City.all
    end

    def create
      @population = params[:population]
      @city = params[:city]
      @landmark = params[:landmark]
      if not City.all.key?(@city.to_sym)
        city = City.new(name: @city, landmark: @landmark, population: @population)
        city.save
      end
    end

    def edit
    end

    def update
      @city = params[:city]
      if not @city.nil? and not City.all[@city.to_sym].nil?
        @population = params[:population]
        @landmark = params[:landmark]
        @update_params = {}
        if not @population.nil?
          @update_params[:population] = @population
        end
        if not @landmark.nil?
          @update_params[:landmark] = @landmark
        end
        City.all[@city.to_sym].update(@update_params)
        redirect_to url_for(controller: 'cities', action: 'view')
      end
    end

  
  end
  