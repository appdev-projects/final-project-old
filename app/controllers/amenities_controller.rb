class AmenitiesController < ApplicationController
  def index
    @amenities = Amenity.all

    render("amenity_templates/index.html.erb")
  end

  def show
    @amenity = Amenity.find(params.fetch("id_to_display"))

    render("amenity_templates/show.html.erb")
  end

  def new_form
    @amenity = Amenity.new

    render("amenity_templates/new_form.html.erb")
  end

  def create_row
    @amenity = Amenity.new

    @amenity.name = params.fetch("name")

    if @amenity.valid?
      @amenity.save

      redirect_back(:fallback_location => "/amenities", :notice => "Amenity created successfully.")
    else
      render("amenity_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @amenity = Amenity.find(params.fetch("prefill_with_id"))

    render("amenity_templates/edit_form.html.erb")
  end

  def update_row
    @amenity = Amenity.find(params.fetch("id_to_modify"))

    @amenity.name = params.fetch("name")

    if @amenity.valid?
      @amenity.save

      redirect_to("/amenities/#{@amenity.id}", :notice => "Amenity updated successfully.")
    else
      render("amenity_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @amenity = Amenity.find(params.fetch("id_to_remove"))

    @amenity.destroy

    redirect_to("/amenities", :notice => "Amenity deleted successfully.")
  end
end
