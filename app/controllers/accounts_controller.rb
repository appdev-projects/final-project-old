class AccountsController < ApplicationController
    def show_user_work
        @user = User.find(params.fetch("user_id"))
        
       render("account_templates/user_page.html.erb") 
    end
end