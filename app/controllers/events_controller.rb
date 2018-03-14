class EventsController < ApplicationController
  def index
    @events = Event.all

    render("event_templates/index.html.erb")
  end

  def show
    @event = Event.find(params.fetch("id_to_display"))

    render("event_templates/show.html.erb")
  end

  def new_form
    render("event_templates/new_form.html.erb")
  end

  def create_row
    @event = Event.new

    @event.city = params.fetch("city")
    @event.event_name = params.fetch("event_name")
    @event.date = params.fetch("date")
    @event.description = params.fetch("description")
    @event.host_id = params.fetch("host_id")

    if @event.valid?
      @event.save

      redirect_to("/events", :notice => "Event created successfully.")
    else
      render("event_templates/new_form.html.erb")
    end
  end

  def edit_form
    @event = Event.find(params.fetch("prefill_with_id"))

    render("event_templates/edit_form.html.erb")
  end

  def update_row
    @event = Event.find(params.fetch("id_to_modify"))

    @event.city = params.fetch("city")
    @event.event_name = params.fetch("event_name")
    @event.date = params.fetch("date")
    @event.description = params.fetch("description")
    @event.host_id = params.fetch("host_id")

    if @event.valid?
      @event.save

      redirect_to("/events/#{@event.id}", :notice => "Event updated successfully.")
    else
      render("event_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @event = Event.find(params.fetch("id_to_remove"))

    @event.destroy

    redirect_to("/events", :notice => "Event deleted successfully.")
  end
end
