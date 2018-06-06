class StatesController < ApplicationController
  def index
    @states = State.all

    render("state_templates/index.html.erb")
  end

  def show
    @state = State.find(params.fetch("id_to_display"))

    render("state_templates/show.html.erb")
  end

  def new_form
    render("state_templates/new_form.html.erb")
  end

  def create_row
    @state = State.new

    @state.state = params.fetch("state")

    if @state.valid?
      @state.save

      redirect_to("/states", :notice => "State created successfully.")
    else
      render("state_templates/new_form.html.erb")
    end
  end

  def edit_form
    @state = State.find(params.fetch("prefill_with_id"))

    render("state_templates/edit_form.html.erb")
  end

  def update_row
    @state = State.find(params.fetch("id_to_modify"))

    @state.state = params.fetch("state")

    if @state.valid?
      @state.save

      redirect_to("/states/#{@state.id}", :notice => "State updated successfully.")
    else
      render("state_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @state = State.find(params.fetch("id_to_remove"))

    @state.destroy

    redirect_to("/states", :notice => "State deleted successfully.")
  end
end
