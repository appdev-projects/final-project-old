class BuildingAmenitiesController < ApplicationController
  def index
    @building_amenities = BuildingAmenity.all

    render("building_amenity_templates/index.html.erb")
  end

  def show
    @building_amenity = BuildingAmenity.find(params.fetch("id_to_display"))

    render("building_amenity_templates/show.html.erb")
  end

  def new_form
    @building_amenity = BuildingAmenity.new

    render("building_amenity_templates/new_form.html.erb")
  end

  def create_row
    @building_amenity = BuildingAmenity.new

    @building_amenity.building_id = params.fetch("building_id")
    @building_amenity.amenity_id = params.fetch("amenity_id")

    if @building_amenity.valid?
      @building_amenity.save

      redirect_back(:fallback_location => "/building_amenities", :notice => "Building amenity created successfully.")
    else
      render("building_amenity_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @building_amenity = BuildingAmenity.find(params.fetch("prefill_with_id"))

    render("building_amenity_templates/edit_form.html.erb")
  end

  def update_row
    @building_amenity = BuildingAmenity.find(params.fetch("id_to_modify"))

    @building_amenity.building_id = params.fetch("building_id")
    @building_amenity.amenity_id = params.fetch("amenity_id")

    if @building_amenity.valid?
      @building_amenity.save

      redirect_to("/building_amenities/#{@building_amenity.id}", :notice => "Building amenity updated successfully.")
    else
      render("building_amenity_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @building_amenity = BuildingAmenity.find(params.fetch("id_to_remove"))

    @building_amenity.destroy

    redirect_to("/building_amenities", :notice => "Building amenity deleted successfully.")
  end
end
