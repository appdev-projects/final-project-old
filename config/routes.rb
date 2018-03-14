Rails.application.routes.draw do
  
  # devise_for :users
  root 'events#index'
  # Routes for the Signup resource:

  # CREATE
  get("/signups/new", { :controller => "signups", :action => "new_form" })
  post("/create_signup", { :controller => "signups", :action => "create_row" })

  # READ
  get("/signups", { :controller => "signups", :action => "index" })
  get("/signups/:id_to_display", { :controller => "signups", :action => "show" })

  # UPDATE
  get("/signups/:prefill_with_id/edit", { :controller => "signups", :action => "edit_form" })
  post("/update_signup/:id_to_modify", { :controller => "signups", :action => "update_row" })

  # DELETE
  get("/delete_signup/:id_to_remove", { :controller => "signups", :action => "destroy_row" })

  #------------------------------

  # Routes for the Event resource:

  # CREATE
  get("/events/new", { :controller => "events", :action => "new_form" })
  post("/create_event", { :controller => "events", :action => "create_row" })

  # READ
  get("/events", { :controller => "events", :action => "index" })
  get("/events/:id_to_display", { :controller => "events", :action => "show" })

  # UPDATE
  get("/events/:prefill_with_id/edit", { :controller => "events", :action => "edit_form" })
  post("/update_event/:id_to_modify", { :controller => "events", :action => "update_row" })

  # DELETE
  get("/delete_event/:id_to_remove", { :controller => "events", :action => "destroy_row" })

  #------------------------------
  # Routes for the User resource:
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_of_user", { :controller => "users", :action => "show" })

  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
