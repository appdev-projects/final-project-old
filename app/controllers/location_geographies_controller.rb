class LocationGeographiesController < ApplicationController
  def index
    @location_geographies = LocationGeography.all

    render("location_geography_templates/index.html.erb")
  end

  def show
    @location_geography = LocationGeography.find(params.fetch("id_to_display"))

    render("location_geography_templates/show.html.erb")
  end

  def new_form
    render("location_geography_templates/new_form.html.erb")
  end

  def create_row
    @location_geography = LocationGeography.new

    @location_geography.geography_id = params.fetch("geography_id")
    @location_geography.location_id = params.fetch("location_id")

    if @location_geography.valid?
      @location_geography.save

      redirect_to("/location_geographies", :notice => "Location geography created successfully.")
    else
      render("location_geography_templates/new_form.html.erb")
    end
  end

  def edit_form
    @location_geography = LocationGeography.find(params.fetch("prefill_with_id"))

    render("location_geography_templates/edit_form.html.erb")
  end

  def update_row
    @location_geography = LocationGeography.find(params.fetch("id_to_modify"))

    @location_geography.geography_id = params.fetch("geography_id")
    @location_geography.location_id = params.fetch("location_id")

    if @location_geography.valid?
      @location_geography.save

      redirect_to("/location_geographies/#{@location_geography.id}", :notice => "Location geography updated successfully.")
    else
      render("location_geography_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @location_geography = LocationGeography.find(params.fetch("id_to_remove"))

    @location_geography.destroy

    redirect_to("/location_geographies", :notice => "Location geography deleted successfully.")
  end
end
