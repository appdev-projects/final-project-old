class BuildingsController < ApplicationController
  def index
    @buildings = Building.all

    render("building_templates/index.html.erb")
  end

  def show
    @building = Building.find(params.fetch("id_to_display"))

    render("building_templates/show.html.erb")
  end

  def new_form
    @building = Building.new

    render("building_templates/new_form.html.erb")
  end

  def create_row
    @building = Building.new

    @building.address = params.fetch("address")
    @building.neighborhood = params.fetch("neighborhood")
    @building.address_latitude = params.fetch("address_latitude")
    @building.address_longitude = params.fetch("address_longitude")

    if @building.valid?
      @building.save

      redirect_back(:fallback_location => "/buildings", :notice => "Building created successfully.")
    else
      render("building_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @building = Building.find(params.fetch("prefill_with_id"))

    render("building_templates/edit_form.html.erb")
  end

  def update_row
    @building = Building.find(params.fetch("id_to_modify"))

    @building.address = params.fetch("address")
    @building.neighborhood = params.fetch("neighborhood")
    @building.address_latitude = params.fetch("address_latitude")
    @building.address_longitude = params.fetch("address_longitude")

    if @building.valid?
      @building.save

      redirect_to("/buildings/#{@building.id}", :notice => "Building updated successfully.")
    else
      render("building_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @building = Building.find(params.fetch("id_to_remove"))

    @building.destroy

    redirect_to("/buildings", :notice => "Building deleted successfully.")
  end
end
