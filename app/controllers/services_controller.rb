class ServicesController < ApplicationController
  def index
    @services = Service.all

    render("service_templates/index.html.erb")
  end

  def show
    @service = Service.find(params.fetch("id_to_display"))

    render("service_templates/show.html.erb")
  end

  def new_form
    render("service_templates/new_form.html.erb")
  end

  def create_row
    @service = Service.new

    @service.name = params.fetch("name")
    @service.crosscover = params.fetch("crosscover")
    @service.vacation = params.fetch("vacation")

    if @service.valid?
      @service.save

      redirect_to("/services", :notice => "Service created successfully.")
    else
      render("service_templates/new_form.html.erb")
    end
  end

  def edit_form
    @service = Service.find(params.fetch("prefill_with_id"))

    render("service_templates/edit_form.html.erb")
  end

  def update_row
    @service = Service.find(params.fetch("id_to_modify"))

    @service.name = params.fetch("name")
    @service.crosscover = params.fetch("crosscover")
    @service.vacation = params.fetch("vacation")

    if @service.valid?
      @service.save

      redirect_to("/services/#{@service.id}", :notice => "Service updated successfully.")
    else
      render("service_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @service = Service.find(params.fetch("id_to_remove"))

    @service.destroy

    redirect_to("/services", :notice => "Service deleted successfully.")
  end
end
