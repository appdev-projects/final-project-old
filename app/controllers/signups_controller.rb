class SignupsController < ApplicationController
  def index
    @signups = Signup.all

    render("signup_templates/index.html.erb")
  end

  def show
    @signup = Signup.find(params.fetch("id_to_display"))

    render("signup_templates/show.html.erb")
  end

  def new_form
    render("signup_templates/new_form.html.erb")
  end

  def create_row
    @signup = Signup.new

    @signup.event_id = params.fetch("event_id")
    @signup.tourist_id = params.fetch("tourist_id")

    if @signup.valid?
      @signup.save

      redirect_to("/events", :notice => "Registered successfully.")
    else
      render("signup_templates/new_form.html.erb")
    end
  end

  def edit_form
    @signup = Signup.find(params.fetch("prefill_with_id"))

    render("signup_templates/edit_form.html.erb")
  end

  def update_row
    @signup = Signup.find(params.fetch("id_to_modify"))

    @signup.event_id = params.fetch("event_id")
    @signup.tourist_id = params.fetch("tourist_id")

    if @signup.valid?
      @signup.save

      redirect_to("/signups/#{@signup.id}", :notice => "Signup updated successfully.")
    else
      render("signup_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @signup = Signup.find(params.fetch("id_to_remove"))

    @signup.destroy

    redirect_to("/events", :notice => "Unregistered successfully.")
  end
end
