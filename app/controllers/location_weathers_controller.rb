class LocationWeathersController < ApplicationController
  def index
    @location_weathers = LocationWeather.all

    render("location_weather_templates/index.html.erb")
  end

  def show
    @location_weather = LocationWeather.find(params.fetch("id_to_display"))

    render("location_weather_templates/show.html.erb")
  end

  def new_form
    render("location_weather_templates/new_form.html.erb")
  end

  def create_row
    @location_weather = LocationWeather.new

    @location_weather.location_id = params.fetch("location_id")
    @location_weather.month = params.fetch("month")
    @location_weather.temperature = params.fetch("temperature")
    @location_weather.weather = params.fetch("weather")

    if @location_weather.valid?
      @location_weather.save

      redirect_to("/location_weathers", :notice => "Location weather created successfully.")
    else
      render("location_weather_templates/new_form.html.erb")
    end
  end

  def edit_form
    @location_weather = LocationWeather.find(params.fetch("prefill_with_id"))

    render("location_weather_templates/edit_form.html.erb")
  end

  def update_row
    @location_weather = LocationWeather.find(params.fetch("id_to_modify"))

    @location_weather.location_id = params.fetch("location_id")
    @location_weather.month = params.fetch("month")
    @location_weather.temperature = params.fetch("temperature")
    @location_weather.weather = params.fetch("weather")

    if @location_weather.valid?
      @location_weather.save

      redirect_to("/location_weathers/#{@location_weather.id}", :notice => "Location weather updated successfully.")
    else
      render("location_weather_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @location_weather = LocationWeather.find(params.fetch("id_to_remove"))

    @location_weather.destroy

    redirect_to("/location_weathers", :notice => "Location weather deleted successfully.")
  end
end
