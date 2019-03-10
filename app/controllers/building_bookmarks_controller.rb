class BuildingBookmarksController < ApplicationController
  def index
    @building_bookmarks = BuildingBookmark.all

    render("building_bookmark_templates/index.html.erb")
  end

  def show
    @building_bookmark = BuildingBookmark.find(params.fetch("id_to_display"))

    render("building_bookmark_templates/show.html.erb")
  end

  def new_form
    @building_bookmark = BuildingBookmark.new

    render("building_bookmark_templates/new_form.html.erb")
  end

  def create_row
    @building_bookmark = BuildingBookmark.new

    @building_bookmark.building_id = params.fetch("building_id")
    @building_bookmark.user_id = params.fetch("user_id")
    @building_bookmark.name = params.fetch("name")

    if @building_bookmark.valid?
      @building_bookmark.save

      redirect_back(:fallback_location => "/building_bookmarks", :notice => "Building bookmark created successfully.")
    else
      render("building_bookmark_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @building_bookmark = BuildingBookmark.find(params.fetch("prefill_with_id"))

    render("building_bookmark_templates/edit_form.html.erb")
  end

  def update_row
    @building_bookmark = BuildingBookmark.find(params.fetch("id_to_modify"))

    @building_bookmark.building_id = params.fetch("building_id")
    @building_bookmark.user_id = params.fetch("user_id")
    @building_bookmark.name = params.fetch("name")

    if @building_bookmark.valid?
      @building_bookmark.save

      redirect_to("/building_bookmarks/#{@building_bookmark.id}", :notice => "Building bookmark updated successfully.")
    else
      render("building_bookmark_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @building_bookmark = BuildingBookmark.find(params.fetch("id_to_remove"))

    @building_bookmark.destroy

    redirect_to("/building_bookmarks", :notice => "Building bookmark deleted successfully.")
  end
end
