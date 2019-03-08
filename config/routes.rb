Rails.application.routes.draw do
  # Routes for the Membership resource:

  # CREATE
  get("/memberships/new", { :controller => "memberships", :action => "new_form" })
  post("/create_membership", { :controller => "memberships", :action => "create_row" })

  # READ
  get("/memberships", { :controller => "memberships", :action => "index" })
  get("/memberships/:id_to_display", { :controller => "memberships", :action => "show" })

  # UPDATE
  get("/memberships/:prefill_with_id/edit", { :controller => "memberships", :action => "edit_form" })
  post("/update_membership/:id_to_modify", { :controller => "memberships", :action => "update_row" })

  # DELETE
  get("/delete_membership/:id_to_remove", { :controller => "memberships", :action => "destroy_row" })

  #------------------------------

  # Routes for the Cause resource:

  # CREATE
  get("/causes/new", { :controller => "causes", :action => "new_form" })
  post("/create_cause", { :controller => "causes", :action => "create_row" })

  # READ
  get("/causes", { :controller => "causes", :action => "index" })
  get("/causes/:id_to_display", { :controller => "causes", :action => "show" })

  # UPDATE
  get("/causes/:prefill_with_id/edit", { :controller => "causes", :action => "edit_form" })
  post("/update_cause/:id_to_modify", { :controller => "causes", :action => "update_row" })

  # DELETE
  get("/delete_cause/:id_to_remove", { :controller => "causes", :action => "destroy_row" })

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

  # Routes for the Customized preference resource:

  # CREATE
  get("/customized_preferences/new", { :controller => "customized_preferences", :action => "new_form" })
  post("/create_customized_preference", { :controller => "customized_preferences", :action => "create_row" })

  # READ
  get("/customized_preferences", { :controller => "customized_preferences", :action => "index" })
  get("/customized_preferences/:id_to_display", { :controller => "customized_preferences", :action => "show" })

  # UPDATE
  get("/customized_preferences/:prefill_with_id/edit", { :controller => "customized_preferences", :action => "edit_form" })
  post("/update_customized_preference/:id_to_modify", { :controller => "customized_preferences", :action => "update_row" })

  # DELETE
  get("/delete_customized_preference/:id_to_remove", { :controller => "customized_preferences", :action => "destroy_row" })

  #------------------------------

  # Routes for the Goal resource:
  
  root "goals#index"

  # CREATE
  get("/goals/new", { :controller => "goals", :action => "new_form" })
  post("/create_goal", { :controller => "goals", :action => "create_row" })

  # READ
  get("/goals", { :controller => "goals", :action => "index" })
  get("/goals/:id_to_display", { :controller => "goals", :action => "show" })

  # UPDATE
  get("/goals/:prefill_with_id/edit", { :controller => "goals", :action => "edit_form" })
  post("/update_goal/:id_to_modify", { :controller => "goals", :action => "update_row" })

  # DELETE
  get("/delete_goal/:id_to_remove", { :controller => "goals", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
