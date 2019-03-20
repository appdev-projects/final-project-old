class MenuAppearancesController < ApplicationController
  def index
    @menu_appearances = MenuAppearance.all

    render("menu_appearance_templates/index.html.erb")
  end

  def show
    @menu_appearance = MenuAppearance.find(params.fetch("id_to_display"))

    render("menu_appearance_templates/show.html.erb")
  end

  def new_form
    @menu_appearance = MenuAppearance.new

    render("menu_appearance_templates/new_form.html.erb")
  end

  def create_row
    @menu_appearance = MenuAppearance.new

    @menu_appearance.recipe_id = params.fetch("recipe_id")
    @menu_appearance.menu_id = params.fetch("menu_id")

    if @menu_appearance.valid?
      @menu_appearance.save

      redirect_back(:fallback_location => "/menu_appearances", :notice => "Menu appearance created successfully.")
    else
      render("menu_appearance_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @menu_appearance = MenuAppearance.find(params.fetch("prefill_with_id"))

    render("menu_appearance_templates/edit_form.html.erb")
  end

  def update_row
    @menu_appearance = MenuAppearance.find(params.fetch("id_to_modify"))

    @menu_appearance.recipe_id = params.fetch("recipe_id")
    @menu_appearance.menu_id = params.fetch("menu_id")

    if @menu_appearance.valid?
      @menu_appearance.save

      redirect_to("/menu_appearances/#{@menu_appearance.id}", :notice => "Menu appearance updated successfully.")
    else
      render("menu_appearance_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @menu_appearance = MenuAppearance.find(params.fetch("id_to_remove"))
    @menu = @menu_appearance.menu_id
    
    @menu_appearance.destroy

    redirect_to("/menus/#{@menu}", :notice => "Menu appearance deleted successfully.")
  end
end
