class ShiftsController < ApplicationController
 
  def index
  if current_user.seniority =="Chief"
    @shifts = Shift.all
  else
    @shifts = Shift.where(user_id: current_user.id)
  end
    render("shift_templates/index.html.erb")
  end

  def show
    @shift = Shift.find(params.fetch("id_to_display"))

    render("shift_templates/show.html.erb")
  end

  def new_form
    render("shift_templates/new_form.html.erb")
  end

  def create_row
    @shift = Shift.new

    @shift.user_id = params.fetch("user_id")
    @shift.service_id = params.fetch("service_id")
    @shift.date = Date.parse(params.fetch("date"))
    @shift.night = params.fetch("night")

    if @shift.valid?
      @shift.save

      redirect_to("/shifts", :notice => "Shift created successfully.")
    else
      render("shift_templates/new_form.html.erb")
    end
  end

  def edit_form
    @shift = Shift.find(params.fetch("prefill_with_id"))

    render("shift_templates/edit_form.html.erb")
  end

  def update_row
    @shift = Shift.find(params.fetch("id_to_modify"))

    @shift.user_id = params.fetch("user_id")
    @shift.service_id = params.fetch("service_id")
    @shift.date = params.fetch("date")
    @shift.night = params.fetch("night")

    if @shift.valid?
      @shift.save

      redirect_to("/shifts/#{@shift.id}", :notice => "Shift updated successfully.")
    else
      render("shift_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @shift = Shift.find(params.fetch("id_to_remove"))

    @shift.destroy

    redirect_to("/shifts", :notice => "Shift deleted successfully.")
  end
end
