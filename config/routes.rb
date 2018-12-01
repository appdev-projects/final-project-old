Rails.application.routes.draw do
  
  # Routes for the Ad resource:

  # CREATE
  get("/ads/new", { :controller => "ads", :action => "new_form" })
  post("/create_ad", { :controller => "ads", :action => "create_row" })

  # READ
  get("/ads", { :controller => "ads", :action => "index" })
  get("/ads/:id_to_display", { :controller => "ads", :action => "show" })

  # UPDATE
  get("/ads/:prefill_with_id/edit", { :controller => "ads", :action => "edit_form" })
  post("/update_ad/:id_to_modify", { :controller => "ads", :action => "update_row" })

  # DELETE
  get("/delete_ad/:id_to_remove", { :controller => "ads", :action => "destroy_row" })

  #------------------------------

  get("/", { :controller => "podcasts", :action => "index" })

  # Routes for the Podcast resource:

  # CREATE
  get("/podcasts/new", { :controller => "podcasts", :action => "new_form" })
  post("/create_podcast", { :controller => "podcasts", :action => "create_row" })

  # READ
  get("/podcasts", { :controller => "podcasts", :action => "index" })
  get("/podcasts/:id_to_display", { :controller => "podcasts", :action => "show" })

  # UPDATE
  get("/podcasts/:prefill_with_id/edit", { :controller => "podcasts", :action => "edit_form" })
  post("/update_podcast/:id_to_modify", { :controller => "podcasts", :action => "update_row" })

  # DELETE
  get("/delete_podcast/:id_to_remove", { :controller => "podcasts", :action => "destroy_row" })

  #------------------------------

  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
