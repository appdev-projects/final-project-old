class MenuStepsController < ApplicationController
  def index
    @menu_steps = MenuStep.all

    render("menu_step_templates/index.html.erb")
  end

  def show
    @menu_step = MenuStep.find(params.fetch("id_to_display"))

    render("menu_step_templates/show.html.erb")
  end

  def new_form
    @menu_step = MenuStep.new

    render("menu_step_templates/new_form.html.erb")
  end

  def create_row
    @menu_step = MenuStep.new

    @menu_step.step_id = params.fetch("step_id")
    @menu_step.menu_appearance_id = params.fetch("menu_appearance_id")

    if @menu_step.valid?
      @menu_step.save

      redirect_back(:fallback_location => "/menu_steps", :notice => "Menu step created successfully.")
    else
      render("menu_step_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @menu_step = MenuStep.find(params.fetch("prefill_with_id"))

    render("menu_step_templates/edit_form.html.erb")
  end

  def update_row
    @menu_step = MenuStep.find(params.fetch("id_to_modify"))

    @menu_step.step_id = params.fetch("step_id")
    @menu_step.menu_appearance_id = params.fetch("menu_appearance_id")

    if @menu_step.valid?
      @menu_step.save

      redirect_to("/menu_steps/#{@menu_step.id}", :notice => "Menu step updated successfully.")
    else
      render("menu_step_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @menu_step = MenuStep.find(params.fetch("id_to_remove"))

    @menu_step.destroy

    redirect_to("/menu_steps", :notice => "Menu step deleted successfully.")
  end
end
