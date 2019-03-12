class AmenityPicturesController < ApplicationController
  def index
    @amenity_pictures = AmenityPicture.all

    render("amenity_picture_templates/index.html.erb")
  end

  def show
    @amenity_picture = AmenityPicture.find(params.fetch("id_to_display"))

    render("amenity_picture_templates/show.html.erb")
  end

  def new_form
    @amenity_picture = AmenityPicture.new

    render("amenity_picture_templates/new_form.html.erb")
  end

  def create_row
    @amenity_picture = AmenityPicture.new

    @amenity_picture.picture = params.fetch("picture")
    @amenity_picture.description = params.fetch("description")
    @amenity_picture.building_amenity_id = params.fetch("building_amenity_id")
    # Cloudinary::Uploader.upload(params.fetch("picture"))

    if @amenity_picture.valid?
      @amenity_picture.save

      redirect_back(:fallback_location => "/amenities/")
    else
      render("amenity_picture_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @amenity_picture = AmenityPicture.find(params.fetch("prefill_with_id"))

    render("amenity_picture_templates/edit_form.html.erb")
  end

  def update_row
    @amenity_picture = AmenityPicture.find(params.fetch("id_to_modify"))

    @amenity_picture.picture = params.fetch("picture")
    @amenity_picture.description = params.fetch("description")
    @amenity_picture.building_amenity_id = params.fetch("building_amenity_id")

    if @amenity_picture.valid?
      @amenity_picture.save

      redirect_to("/amenity_pictures/#{@amenity_picture.id}", :notice => "Amenity picture updated successfully.")
    else
      render("amenity_picture_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @amenity_picture = AmenityPicture.find(params.fetch("id_to_remove"))

    @amenity_picture.destroy

    redirect_to("/amenity_pictures", :notice => "Amenity picture deleted successfully.")
  end
end
