Rails.application.routes.draw do
  # Routes for the Menu step resource:

  # CREATE
  get("/menu_steps/new", { :controller => "menu_steps", :action => "new_form" })
  post("/create_menu_step", { :controller => "menu_steps", :action => "create_row" })

  # READ
  get("/menu_steps", { :controller => "menu_steps", :action => "index" })
  get("/menu_steps/:id_to_display", { :controller => "menu_steps", :action => "show" })

  # UPDATE
  get("/menu_steps/:prefill_with_id/edit", { :controller => "menu_steps", :action => "edit_form" })
  post("/update_menu_step/:id_to_modify", { :controller => "menu_steps", :action => "update_row" })

  # DELETE
  get("/delete_menu_step/:id_to_remove", { :controller => "menu_steps", :action => "destroy_row" })

  #------------------------------

  # Routes for the Menu appearance resource:

  # CREATE
  get("/menu_appearances/new", { :controller => "menu_appearances", :action => "new_form" })
  post("/create_menu_appearance", { :controller => "menu_appearances", :action => "create_row" })

  # READ
  get("/menu_appearances", { :controller => "menu_appearances", :action => "index" })
  get("/menu_appearances/:id_to_display", { :controller => "menu_appearances", :action => "show" })

  # UPDATE
  get("/menu_appearances/:prefill_with_id/edit", { :controller => "menu_appearances", :action => "edit_form" })
  post("/update_menu_appearance/:id_to_modify", { :controller => "menu_appearances", :action => "update_row" })

  # DELETE
  get("/delete_menu_appearance/:id_to_remove", { :controller => "menu_appearances", :action => "destroy_row" })

  #------------------------------

  # Routes for the Menu resource:

  # CREATE
  get("/menus/new", { :controller => "menus", :action => "new_form" })
  post("/create_menu", { :controller => "menus", :action => "create_row" })

  # READ
  get("/menus", { :controller => "menus", :action => "index" })
  get("/menus/:id_to_display", { :controller => "menus", :action => "show" })
  get("/menus/cook/:id_to_display", { :controller => "menus", :action => "cook" })

  # UPDATE
  get("/menus/:prefill_with_id/edit", { :controller => "menus", :action => "edit_form" })
  post("/update_menu/:id_to_modify", { :controller => "menus", :action => "update_row" })
  get("/update_menu_time_index/:prefill_with_id", { :controller => "menus", :action => "update_time_index" })
  get("/update_menu_time_cook/:prefill_with_id", { :controller => "menus", :action => "update_time_cook" })
  post("/five_more_minutes/:prefill_with_id", { :controller => "menus", :action => "give_five" })
  
  # DELETE
  get("/delete_menu/:id_to_remove", { :controller => "menus", :action => "destroy_row" })

  #------------------------------

  # Routes for the Step resource:

  # CREATE
  get("/steps/new", { :controller => "steps", :action => "new_form" })
  post("/create_step", { :controller => "steps", :action => "create_row" })

  # READ
  get("/steps", { :controller => "steps", :action => "index" })
  get("/steps/:id_to_display", { :controller => "steps", :action => "show" })

  # UPDATE
  get("/steps/:prefill_with_id/edit", { :controller => "steps", :action => "edit_form" })
  post("/update_step/:id_to_modify", { :controller => "steps", :action => "update_row" })
  

  # DELETE
  get("/delete_step/:id_to_remove", { :controller => "steps", :action => "destroy_row" })

  #------------------------------

  # Routes for the Recipe resource:

  # CREATE
  get("/recipes/new", { :controller => "recipes", :action => "new_form" })
  post("/create_recipe", { :controller => "recipes", :action => "create_row" })

  # READ
  get("/recipes", { :controller => "recipes", :action => "index" })
  get("/recipes/:id_to_display", { :controller => "recipes", :action => "show" })

  # UPDATE
  get("/recipes/:prefill_with_id/edit", { :controller => "recipes", :action => "edit_form" })
  post("/update_recipe/:id_to_modify", { :controller => "recipes", :action => "update_row" })
  get("/update_recipe_time/:id_to_modify", { :controller => "recipes", :action => "update_time" })
  
  # DELETE
  get("/delete_recipe/:id_to_remove", { :controller => "recipes", :action => "destroy_row" })
  #------------------------------
  root "recipes#index"
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Routes for the users resource:

  get("/account/:user_id", { :controller => "accounts", :action => "show_user_work" })  

  #-----------line 102 is the route that I created to -------------------
  
  #------------------------------

end
