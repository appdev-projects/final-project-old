class LocationsController < ApplicationController
  def index
    @locations = Location.all

    render("location_templates/index.html.erb")
  end

  def show
    @location = Location.find(params.fetch("id_to_display"))

    render("location_templates/show.html.erb")
  end

  def new_form
    render("location_templates/new_form.html.erb")
  end

  def create_row
    @location = Location.new

    @location.city_name = params.fetch("city_name")
    @location.state_name = params.fetch("state_name")
    @location.country_name = params.fetch("country_name")
    @location.lat = params.fetch("lat")
    @location.long = params.fetch("long")
    @location.image = params.fetch("image")

    if @location.valid?
      @location.save

      redirect_to("/locations", :notice => "Location created successfully.")
    else
      render("location_templates/new_form.html.erb")
    end
  end

  def edit_form
    @location = Location.find(params.fetch("prefill_with_id"))

    render("location_templates/edit_form.html.erb")
  end

  def update_row
    @location = Location.find(params.fetch("id_to_modify"))

    @location.city_name = params.fetch("city_name")
    @location.state_name = params.fetch("state_name")
    @location.country_name = params.fetch("country_name")
    @location.lat = params.fetch("lat")
    @location.long = params.fetch("long")
    @location.image = params.fetch("image")

    if @location.valid?
      @location.save

      redirect_to("/locations/#{@location.id}", :notice => "Location updated successfully.")
    else
      render("location_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @location = Location.find(params.fetch("id_to_remove"))

    @location.destroy

    redirect_to("/locations", :notice => "Location deleted successfully.")
  end
end
