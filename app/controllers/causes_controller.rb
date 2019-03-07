class CausesController < ApplicationController
  def index
    @causes = Cause.all

    render("cause_templates/index.html.erb")
  end

  def show
    @cause = Cause.find(params.fetch("id_to_display"))

    render("cause_templates/show.html.erb")
  end

  def new_form
    @cause = Cause.new

    render("cause_templates/new_form.html.erb")
  end

  def create_row
    @cause = Cause.new

    @cause.description = params.fetch("description")
    @cause.name = params.fetch("name")
    @cause.goal_amount = params.fetch("goal_amount")
    @cause.current_amount = params.fetch("current_amount")

    if @cause.valid?
      @cause.save

      redirect_back(:fallback_location => "/causes", :notice => "Cause created successfully.")
    else
      render("cause_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @cause = Cause.find(params.fetch("prefill_with_id"))

    render("cause_templates/edit_form.html.erb")
  end

  def update_row
    @cause = Cause.find(params.fetch("id_to_modify"))

    @cause.description = params.fetch("description")
    @cause.name = params.fetch("name")
    @cause.goal_amount = params.fetch("goal_amount")
    @cause.current_amount = params.fetch("current_amount")

    if @cause.valid?
      @cause.save

      redirect_to("/causes/#{@cause.id}", :notice => "Cause updated successfully.")
    else
      render("cause_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @cause = Cause.find(params.fetch("id_to_remove"))

    @cause.destroy

    redirect_to("/causes", :notice => "Cause deleted successfully.")
  end
end
