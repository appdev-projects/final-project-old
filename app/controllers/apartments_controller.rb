class ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.all

    render("apartment_templates/index.html.erb")
  end

  def show
    @apartment = Apartment.find(params.fetch("id_to_display"))

    render("apartment_templates/show.html.erb")
  end

  def new_form
    @apartment = Apartment.new

    render("apartment_templates/new_form.html.erb")
  end

  def create_row
    @apartment = Apartment.new

    @apartment.user_id = params.fetch("user_id")
    @apartment.description = params.fetch("description")
    @apartment.floor_plan = params.fetch("floor_plan")
    @apartment.building_id = params.fetch("building_id")
    @apartment.bedrooms = params.fetch("bedrooms")
    @apartment.bathrooms = params.fetch("bathrooms")
    @apartment.sq_footage = params.fetch("sq_footage")
    @apartment.orientation = params.fetch("orientation")
    @apartment.floor = params.fetch("floor")

    if @apartment.valid?
      @apartment.save

      redirect_back(:fallback_location => "/apartments", :notice => "Apartment created successfully.")
    else
      render("apartment_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @apartment = Apartment.find(params.fetch("prefill_with_id"))

    render("apartment_templates/edit_form.html.erb")
  end

  def update_row
    @apartment = Apartment.find(params.fetch("id_to_modify"))

    @apartment.user_id = params.fetch("user_id")
    @apartment.description = params.fetch("description")
    @apartment.floor_plan = params.fetch("floor_plan")
    @apartment.building_id = params.fetch("building_id")
    @apartment.bedrooms = params.fetch("bedrooms")
    @apartment.bathrooms = params.fetch("bathrooms")
    @apartment.sq_footage = params.fetch("sq_footage")
    @apartment.orientation = params.fetch("orientation")
    @apartment.floor = params.fetch("floor")

    if @apartment.valid?
      @apartment.save

      redirect_to("/apartments/#{@apartment.id}", :notice => "Apartment updated successfully.")
    else
      render("apartment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @apartment = Apartment.find(params.fetch("id_to_remove"))

    @apartment.destroy

    redirect_to("/apartments", :notice => "Apartment deleted successfully.")
  end
end
