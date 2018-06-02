class UsersController < ApplicationController
  def index
    @users = User.all

    render("user_templates/index.html.erb")
  end

  def show
    @user = User.find(params.fetch("id_to_display"))

    render("user_templates/show.html.erb")
  end

  def mine
    @user = User.find(current_user.id)
    
    render("user_templates/mine.html.erb")
  end

  def edit_user_form
    @user = User.find(params.fetch("user_id"))
    render("user_templates/edit_user_form.html.erb")
  end

  def edit_user
    
  end

  def destroy_row
    @user = User.find(params.fetch("id_to_remove"))
    
    @user.destroy
    redirect_to("/users", :notice => "Resident Account deleted successfully.")
  end
  
  
end
