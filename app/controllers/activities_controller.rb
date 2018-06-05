class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all

    render("activity_templates/index.html.erb")
  end

  def show
    @activity = Activity.find(params.fetch("id_to_display"))

    render("activity_templates/show.html.erb")
  end

  def new_form
    render("activity_templates/new_form.html.erb")
  end

  def create_row
    @activity = Activity.new

    @activity.activity = params.fetch("activity")
    @activity.category = params.fetch("category")

    if @activity.valid?
      @activity.save

      redirect_to("/activities", :notice => "Activity created successfully.")
    else
      render("activity_templates/new_form.html.erb")
    end
  end

  def edit_form
    @activity = Activity.find(params.fetch("prefill_with_id"))

    render("activity_templates/edit_form.html.erb")
  end

  def update_row
    @activity = Activity.find(params.fetch("id_to_modify"))

    @activity.activity = params.fetch("activity")
    @activity.category = params.fetch("category")

    if @activity.valid?
      @activity.save

      redirect_to("/activities/#{@activity.id}", :notice => "Activity updated successfully.")
    else
      render("activity_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @activity = Activity.find(params.fetch("id_to_remove"))

    @activity.destroy

    redirect_to("/activities", :notice => "Activity deleted successfully.")
  end
end
