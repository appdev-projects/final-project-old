Rails.application.routes.draw do
  
  # Routes for the Vac req resource:

  # CREATE
  get("/vac_reqs/new", { :controller => "vac_reqs", :action => "new_form" })
  post("/create_vac_req", { :controller => "vac_reqs", :action => "create_row" })

  # READ
  get("/vac_reqs", { :controller => "vac_reqs", :action => "index" })
  get("/vac_reqs/:id_to_display", { :controller => "vac_reqs", :action => "show" })

  # UPDATE
  get("/vac_reqs/:prefill_with_id/edit", { :controller => "vac_reqs", :action => "edit_form" })
  post("/update_vac_req/:id_to_modify", { :controller => "vac_reqs", :action => "update_row" })

  # DELETE
  get("/delete_vac_req/:id_to_remove", { :controller => "vac_reqs", :action => "destroy_row" })

  #------------------------------

  # Routes for the Block resource:

  # CREATE
  get("/blocks/new", { :controller => "blocks", :action => "new_form" })
  post("/create_block", { :controller => "blocks", :action => "create_row" })

  # READ
  get("/blocks", { :controller => "blocks", :action => "index" })
  get("/blocks/:id_to_display", { :controller => "blocks", :action => "show" })

  # UPDATE
  get("/blocks/:prefill_with_id/edit", { :controller => "blocks", :action => "edit_form" })
  post("/update_block/:id_to_modify", { :controller => "blocks", :action => "update_row" })

  # DELETE
  get("/delete_block/:id_to_remove", { :controller => "blocks", :action => "destroy_row" })

  #------------------------------

  # Routes for the Shift resource:

  # CREATE
  get("/shifts/new", { :controller => "shifts", :action => "new_form" })
  post("/create_shift", { :controller => "shifts", :action => "create_row" })

  # READ
  get("/shifts", { :controller => "shifts", :action => "index" })
  get("/shifts/:id_to_display", { :controller => "shifts", :action => "show" })

  # UPDATE
  get("/shifts/:prefill_with_id/edit", { :controller => "shifts", :action => "edit_form" })
  post("/update_shift/:id_to_modify", { :controller => "shifts", :action => "update_row" })

  # DELETE
  get("/delete_shift/:id_to_remove", { :controller => "shifts", :action => "destroy_row" })

  #------------------------------

  # Routes for the Service resource:

  # CREATE
  get("/services/new", { :controller => "services", :action => "new_form" })
  post("/create_service", { :controller => "services", :action => "create_row" })

  # READ
  get("/services", { :controller => "services", :action => "index" })
  get("/services/:id_to_display", { :controller => "services", :action => "show" })

  # UPDATE
  get("/services/:prefill_with_id/edit", { :controller => "services", :action => "edit_form" })
  post("/update_service/:id_to_modify", { :controller => "services", :action => "update_row" })

  # DELETE
  get("/delete_service/:id_to_remove", { :controller => "services", :action => "destroy_row" })

  #------------------------------

root "shifts#index"

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #READ
  get("/users", {:controller => "users", :action => "index"})
  get("/users/:id_to_display", {:controller => "users", :action => "show"})
  get("/my_likes", {:controller => "users", :action => "mine"})
  
  # DELETE
  get("/delete_user/:id_to_remove", { :controller => "users", :action => "destroy_row" })
  
end
