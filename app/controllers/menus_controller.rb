class MenusController < ApplicationController
  def index
    @menus = Menu.all

    render("menu_templates/index.html.erb")
  end

  def show
    @menu = Menu.find(params.fetch("id_to_display"))

    render("menu_templates/show.html.erb")
  end

  def new_form
    @menu = Menu.new

    render("menu_templates/new_form.html.erb")
  end

  def create_row
    @menu = Menu.new

    @menu.user_id = params.fetch("user_id")
    @menu.name = params.fetch("name")
    @menu.servings = params.fetch("servings")
    @menu.description = params.fetch("description")
    
    @date = Date.today
    @hour = params.fetch("hour").to_i + params.fetch("hour").to_i
    @minutes = params.fetch("minute")
    
    # t = "#{@date} #{@hour}:#{@minutes}:00 +0000"
    # m = t.to_datetime m.strftime("%Y-%m-%d %H:%M:%S %Z")
    
    @menu.target_completion_time = params.fetch("target_completion_time")
    
    if @menu.valid?
      @menu.save

      redirect_back(:fallback_location => "/menus", :notice => "Menu created successfully.")
    else
      render("menu_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @menu = Menu.find(params.fetch("prefill_with_id"))

    render("menu_templates/edit_form.html.erb")
  end

  def update_row
    @menu = Menu.find(params.fetch("id_to_modify"))

    @menu.user_id = params.fetch("user_id")
    @menu.name = params.fetch("name")
    @menu.servings = params.fetch("servings")
    @menu.target_completion_time = params.fetch("target_completion_time")
    @menu.description = params.fetch("description")

    if @menu.valid?
      @menu.save

      redirect_to("/menus/#{@menu.id}", :notice => "Menu updated successfully.")
    else
      render("menu_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @menu = Menu.find(params.fetch("id_to_remove"))

    @menu.destroy

    redirect_to("/menus", :notice => "Menu deleted successfully.")
  end
end
