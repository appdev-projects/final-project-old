require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather_form
    # Nothing to do here.
    render("street_to_weather_form.html.erb")
  end

  def street_to_weather
    @street_address = params[:user_street_address]
    @url_safe_street_address = URI.encode(@street_address)

    # ==========================================================================
    # Your code goes below.
    # The street address the user input is in the string @street_address.
    # A URL-safe version of the street address, with spaces and other illegal
    #   characters removed, is in the string url_safe_street_address.
    # ==========================================================================
    @url = "https://maps.googleapis.com/maps/api/geocode/json?address="+@url_safe_street_address.to_s
    @parsed_result = JSON.parse(open(@url).read)
    @latitude = @parsed_result.dig("results", 0, "geometry", "location", "lat").to_s
    @longitude = @parsed_result.dig("results", 0, "geometry", "location", "lng").to_s

    @url2="https://api.darksky.net/forecast/2c822d92f31656e2262fa7f6429ef27a/"+@latitude.to_s+","+@longitude.to_s
    @parsed_data = JSON.parse(open(@url2).read)
    
    @current_temperature = @parsed_data.dig("currently", "temperature").to_s

    @current_summary = @parsed_data.dig("currently", "summary").to_s

    @summary_of_next_sixty_minutes = @parsed_data.dig("minutely", "summary").to_s

    @summary_of_next_several_hours = @parsed_data.dig("hourly", "summary").to_s

    @summary_of_next_several_days = @parsed_data.dig("daily", "summary").to_s
    

    render("meteorologist/street_to_weather.html.erb")
  end
end
