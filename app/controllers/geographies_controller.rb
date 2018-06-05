class GeographiesController < ApplicationController
  def index
    @geographies = Geography.all

    render("geography_templates/index.html.erb")
  end

  def show
    @geography = Geography.find(params.fetch("id_to_display"))

    render("geography_templates/show.html.erb")
  end

  def new_form
    render("geography_templates/new_form.html.erb")
  end

  def create_row
    @geography = Geography.new

    @geography.geography = params.fetch("geography")

    if @geography.valid?
      @geography.save

      redirect_to("/geographies", :notice => "Geography created successfully.")
    else
      render("geography_templates/new_form.html.erb")
    end
  end

  def edit_form
    @geography = Geography.find(params.fetch("prefill_with_id"))

    render("geography_templates/edit_form.html.erb")
  end

  def update_row
    @geography = Geography.find(params.fetch("id_to_modify"))

    @geography.geography = params.fetch("geography")

    if @geography.valid?
      @geography.save

      redirect_to("/geographies/#{@geography.id}", :notice => "Geography updated successfully.")
    else
      render("geography_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @geography = Geography.find(params.fetch("id_to_remove"))

    @geography.destroy

    redirect_to("/geographies", :notice => "Geography deleted successfully.")
  end
end
