class ApartmentPhotosController < ApplicationController
  def index
    @apartment_photos = ApartmentPhoto.all

    render("apartment_photo_templates/index.html.erb")
  end

  def show
    @apartment_photo = ApartmentPhoto.find(params.fetch("id_to_display"))

    render("apartment_photo_templates/show.html.erb")
  end

  def new_form
    @apartment_photo = ApartmentPhoto.new

    render("apartment_photo_templates/new_form.html.erb")
  end

  def create_row
    @apartment_photo = ApartmentPhoto.new

    @apartment_photo.description = params.fetch("description")
    @apartment_photo.apartment_id = params.fetch("apartment_id")
    @apartment_photo.photo = params.fetch("photo")

    if @apartment_photo.valid?
      @apartment_photo.save

      redirect_back(:fallback_location => "/apartment_photos", :notice => "Apartment photo created successfully.")
    else
      render("apartment_photo_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @apartment_photo = ApartmentPhoto.find(params.fetch("prefill_with_id"))

    render("apartment_photo_templates/edit_form.html.erb")
  end

  def update_row
    @apartment_photo = ApartmentPhoto.find(params.fetch("id_to_modify"))

    @apartment_photo.description = params.fetch("description")
    @apartment_photo.apartment_id = params.fetch("apartment_id")
    @apartment_photo.photo = params.fetch("photo")

    if @apartment_photo.valid?
      @apartment_photo.save

      redirect_to("/apartment_photos/#{@apartment_photo.id}", :notice => "Apartment photo updated successfully.")
    else
      render("apartment_photo_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @apartment_photo = ApartmentPhoto.find(params.fetch("id_to_remove"))

    @apartment_photo.destroy

    redirect_to("/apartment_photos", :notice => "Apartment photo deleted successfully.")
  end
end
