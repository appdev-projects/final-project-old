class LocationActivitiesController < ApplicationController
  def index
    @location_activities = LocationActivity.all

    render("location_activity_templates/index.html.erb")
  end

  def show
    @location_activity = LocationActivity.find(params.fetch("id_to_display"))

    render("location_activity_templates/show.html.erb")
  end

  def new_form
    render("location_activity_templates/new_form.html.erb")
  end

  def create_row
    @location_activity = LocationActivity.new

    @location_activity.location_id = params.fetch("location_id")
    @location_activity.activity_id = params.fetch("activity_id")
    @location_activity.feature_rating = params.fetch("feature_rating")

    if @location_activity.valid?
      @location_activity.save

      redirect_to("/location_activities", :notice => "Location activity created successfully.")
    else
      render("location_activity_templates/new_form.html.erb")
    end
  end

  def edit_form
    @location_activity = LocationActivity.find(params.fetch("prefill_with_id"))

    render("location_activity_templates/edit_form.html.erb")
  end

  def update_row
    @location_activity = LocationActivity.find(params.fetch("id_to_modify"))

    @location_activity.location_id = params.fetch("location_id")
    @location_activity.activity_id = params.fetch("activity_id")
    @location_activity.feature_rating = params.fetch("feature_rating")

    if @location_activity.valid?
      @location_activity.save

      redirect_to("/location_activities/#{@location_activity.id}", :notice => "Location activity updated successfully.")
    else
      render("location_activity_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @location_activity = LocationActivity.find(params.fetch("id_to_remove"))

    @location_activity.destroy

    redirect_to("/location_activities", :notice => "Location activity deleted successfully.")
  end
end
