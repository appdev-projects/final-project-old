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
    
    # @date = Date.today
    # @hour = params.fetch("hour").to_i + params.fetch("hour").to_i
    # @minutes = params.fetch("minute")
    
    # t = "#{@date} #{@hour}:#{@minutes}:00 +0000"
    # m = t.to_datetime m.strftime("%Y-%m-%d %H:%M:%S %Z")
    
    
    @settime = params.fetch("target_completion_time")
    
    @menu.target_completion_time = Chronic.parse(@settime)

    if @menu.valid?
      @menu.save

      redirect_to("/menus/#{@menu.id}", :notice => "Menu created successfully.")
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
  
  def cook
    @menu = Menu.find(params.fetch("id_to_display"))
    
    s = []
    @menu.recipes.each do |recipes|
      recipes.steps.each do |steps|
        s.push(steps.time_length.to_i)
      end
    end

    @minimumtime = s.sort.first
    @oneminutesize= 120/@minimumtime
      
    @finishtime_integer = @menu.target_completion_time.to_i
    @starttime_integer =  @finishtime_integer- @menu.menu_total_time*60
    
    @starttime = Time.at(@starttime_integer)
    
    @time_measures = []
    
    t = @finishtime_integer 
    
    while t-60 > @starttime_integer
      t = t-60
      @time_measures.push(t)
    end

    render("menu_templates/cook_menu.html.erb")
  end
  def update_time_index
    @menu = Menu.find(params.fetch("prefill_with_id"))
    
    m = [0]
    @menu.recipes.each do |recipe|
     m.push(recipe.total_time.to_i)
    end
    
    @menu.menu_total_time = m.max
    
    # a = [0]
    # @menu.menu_steps.each do |step|
    #   if step.active = 1
    #   a.push(step.time_length.to_i)
    #   else
    #   a.push(0)
    #   end
    # end
    
    # @activetime = a.sum
    
    # if @activetime > @max
    #   @menu.menu_total_time = @activetime
    # else
    #   @menu.menu_total_time = @max
    # end
    
    @menu.save
  
    redirect_to("/menus", :notice => "Menu Complete!")  
  end
  def update_time_cook
    @menu = Menu.find(params.fetch("prefill_with_id"))
    
    m = [0]
    @menu.recipes.each do |recipe|
     m.push(recipe.total_time.to_i)
    end
    
    @menu.menu_total_time = m.max
    
    # a = [0]
    # @menu.menu_steps.each do |step|
    #   if step.active = 1
    #   a.push(step.time_length.to_i)
    #   else
    #   a.push(0)
    #   end
    # end
    
    # @activetime = a.sum
    
    # if @activetime > @max
    #   @menu.menu_total_time = @activetime
    # else
    #   @menu.menu_total_time = @max
    # end
    
    @menu.save 
  
    redirect_to("/menus/cook/#{@menu.id}", :notice => "Menu Complete!")      
  end

  def destroy_row
    @menu = Menu.find(params.fetch("id_to_remove"))

    @menu.destroy

    redirect_to("/menus", :notice => "Menu deleted successfully.")
  end
  def user_show
  
  end
end
