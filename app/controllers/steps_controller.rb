class StepsController < ApplicationController
  def index
    @steps = Step.all

    render("step_templates/index.html.erb")
  end

  def show
    @step = Step.find(params.fetch("id_to_display"))

    render("step_templates/show.html.erb")
  end

  def new_form
    @step = Step.new

    render("step_templates/new_form.html.erb")
  end

  def create_row
    @step = Step.new

    @step.recipe_id = params.fetch("recipe_id")
    @step.active = params.fetch("active")
    @step.equipment_used = params.fetch("equipment_used")
    @step.description = params.fetch("description")
    @step.sequence_number = params.fetch("sequence_number")
    @step.time_length = params.fetch("time_length")

    if @step.valid?
      @step.save

      redirect_back(:fallback_location => "/steps", :notice => "Step created successfully.")
    else
      render("step_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @step = Step.find(params.fetch("prefill_with_id"))

    render("step_templates/edit_form.html.erb")
  end

  def update_row
    @step = Step.find(params.fetch("id_to_modify"))

    @step.recipe_id = params.fetch("recipe_id")
    @step.active = params.fetch("active")
    @step.equipment_used = params.fetch("equipment_used")
    @step.description = params.fetch("description")
    @step.sequence_number = params.fetch("sequence_number")
    @step.time_length = params.fetch("time_length")

    if @step.valid?
      @step.save

      redirect_to("/steps/#{@step.id}", :notice => "Step updated successfully.")
    else
      render("step_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @step = Step.find(params.fetch("id_to_remove"))

    @step.destroy

    redirect_to("/steps", :notice => "Step deleted successfully.")
  end
end
