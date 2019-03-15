class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

    render("recipe_templates/index.html.erb")
  end

  def show
    @recipe = Recipe.find(params.fetch("id_to_display"))
    @steps = @recipe.steps.all
    
    render("recipe_templates/show.html.erb")
  end

  def new_form
    @recipe = Recipe.new

    render("recipe_templates/new_form.html.erb")
  end

  def create_row
    @recipe = Recipe.new

    @recipe.title = params.fetch("title")
    @recipe.number_served = params.fetch("number_served")
    @recipe.user_id = params.fetch("user_id")
    @recipe.description = params.fetch("description")

    if @recipe.valid?
      @recipe.save

    redirect_to("/recipes/#{@recipe.id}", :notice => "Recipe created successfully.")
    else
      render("recipe_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @recipe = Recipe.find(params.fetch("prefill_with_id"))

    render("recipe_templates/edit_form.html.erb")
  end

  def update_row
    @recipe = Recipe.find(params.fetch("id_to_modify"))

    @recipe.title = params.fetch("title")
    @recipe.number_served = params.fetch("number_served")
    @recipe.user_id = params.fetch("user_id")
    @recipe.description = params.fetch("description")
    @recipe.total_time = params.fetch("total_time")

    if @recipe.valid?
      @recipe.save

      redirect_to("/recipes/#{@recipe.id}", :notice => "Recipe updated successfully.")
    else
      render("recipe_templates/edit_form_with_errors.html.erb")
    end
  end
  def update_time
    @recipe = Recipe.find(params.fetch("id_to_modify"))
    
    t = [0]
    @recipe.steps.each do |step|
     t.push(step.time_length.to_i)
    end
    
    @recipe.total_time = t.sum
  
    @recipe.save
    
   redirect_to("/recipes", :notice => "Recipe Complete!")
  end
  def destroy_row
    @recipe = Recipe.find(params.fetch("id_to_remove"))

    @recipe.destroy

    redirect_to("/recipes", :notice => "Recipe deleted successfully.")
  end
end
