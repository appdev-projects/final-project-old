class UsersController < ApplicationController
  
  def index
    @users = User.all
    render("user_templates/index.html.erb")
  end
  
  def show
    @user = User.find(params.fetch("id_of_user"))
    if @user.valid?
      render("user_templates/show.html.erb")
    else
      render("user_templates/index.html.erb")
    end
  end
end