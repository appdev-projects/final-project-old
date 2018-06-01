class AssignmentsController < ApplicationController
  def index
    if current_user.seniority =="Chief"
      @assignments = Assignment.all
    else
      @assignments = Assignment.where(user_id: current_user.id)
    end
    
    render("assignment_templates/index.html.erb")
  end

  def show
    @assignment = Assignment.find(params.fetch("id_to_display"))

    render("assignment_templates/show.html.erb")
  end

  def new_form
    render("assignment_templates/new_form.html.erb")
  end

  def create_row
    @assignment = Assignment.new

    @assignment.block_id = params.fetch("block_id")
    @assignment.user_id = params.fetch("user_id")
    @assignment.service_id = params.fetch("service_id")

    if @assignment.valid?
      @assignment.save

      redirect_to("/assignments", :notice => "Assignment created successfully.")
    else
      render("assignment_templates/new_form.html.erb")
    end
  end

  def edit_form
    @assignment = Assignment.find(params.fetch("prefill_with_id"))

    render("assignment_templates/edit_form.html.erb")
  end

  def update_row
    @assignment = Assignment.find(params.fetch("id_to_modify"))

    @assignment.block_id = params.fetch("block_id")
    @assignment.user_id = params.fetch("user_id")
    @assignment.service_id = params.fetch("service_id")

    if @assignment.valid?
      @assignment.save

      redirect_to("/assignments/#{@assignment.id}", :notice => "Assignment updated successfully.")
    else
      render("assignment_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @assignment = Assignment.find(params.fetch("id_to_remove"))

    @assignment.destroy

    redirect_to("/assignments", :notice => "Assignment deleted successfully.")
  end
end
