Rails.application.routes.draw do
  
  get("/", { :controller => "application", :action => "index" })
  get("/index", { :controller => "application", :action => "index" })
  get("/search", { :controller => "application", :action => "search" })
  post("/get_results", { :controller => "application", :action => "results" })
  
  # Routes for the Location resource:

  # CREATE
  get("/locations/new", { :controller => "locations", :action => "new_form" })
  post("/create_location", { :controller => "locations", :action => "create_row" })

  # READ
  get("/locations", { :controller => "locations", :action => "index" })
  get("/locations/:id_to_display", { :controller => "locations", :action => "show" })

  # UPDATE
  get("/locations/:prefill_with_id/edit", { :controller => "locations", :action => "edit_form" })
  post("/update_location/:id_to_modify", { :controller => "locations", :action => "update_row" })

  # DELETE
  get("/delete_location/:id_to_remove", { :controller => "locations", :action => "destroy_row" })

  #------------------------------

  # Routes for the Location weather resource:

  # CREATE
  get("/location_weathers/new", { :controller => "location_weathers", :action => "new_form" })
  post("/create_location_weather", { :controller => "location_weathers", :action => "create_row" })

  # READ
  get("/location_weathers", { :controller => "location_weathers", :action => "index" })
  get("/location_weathers/:id_to_display", { :controller => "location_weathers", :action => "show" })

  # UPDATE
  get("/location_weathers/:prefill_with_id/edit", { :controller => "location_weathers", :action => "edit_form" })
  post("/update_location_weather/:id_to_modify", { :controller => "location_weathers", :action => "update_row" })

  # DELETE
  get("/delete_location_weather/:id_to_remove", { :controller => "location_weathers", :action => "destroy_row" })

  #------------------------------

  # Routes for the Location activity resource:

  # CREATE
  get("/location_activities/new", { :controller => "location_activities", :action => "new_form" })
  post("/create_location_activity", { :controller => "location_activities", :action => "create_row" })

  # READ
  get("/location_activities", { :controller => "location_activities", :action => "index" })
  get("/location_activities/:id_to_display", { :controller => "location_activities", :action => "show" })

  # UPDATE
  get("/location_activities/:prefill_with_id/edit", { :controller => "location_activities", :action => "edit_form" })
  post("/update_location_activity/:id_to_modify", { :controller => "location_activities", :action => "update_row" })

  # DELETE
  get("/delete_location_activity/:id_to_remove", { :controller => "location_activities", :action => "destroy_row" })
  
  get("/add_count/:id_to_modify", { :controller => "location_activities", :action => "add_count" })
  get("/remove_count/:id_to_modify", { :controller => "location_activities", :action => "remove_count" })

  #------------------------------

  # Routes for the Activity resource:

  # CREATE
  get("/activities/new", { :controller => "activities", :action => "new_form" })
  post("/create_activity", { :controller => "activities", :action => "create_row" })

  # READ
  get("/activities", { :controller => "activities", :action => "index" })
  get("/activities/:id_to_display", { :controller => "activities", :action => "show" })

  # UPDATE
  get("/activities/:prefill_with_id/edit", { :controller => "activities", :action => "edit_form" })
  post("/update_activity/:id_to_modify", { :controller => "activities", :action => "update_row" })

  # DELETE
  get("/delete_activity/:id_to_remove", { :controller => "activities", :action => "destroy_row" })

  #------------------------------

  # Routes for the Geography resource:

  # CREATE
  get("/geographies/new", { :controller => "geographies", :action => "new_form" })
  post("/create_geography", { :controller => "geographies", :action => "create_row" })

  # READ
  get("/geographies", { :controller => "geographies", :action => "index" })
  get("/geographies/:id_to_display", { :controller => "geographies", :action => "show" })

  # UPDATE
  get("/geographies/:prefill_with_id/edit", { :controller => "geographies", :action => "edit_form" })
  post("/update_geography/:id_to_modify", { :controller => "geographies", :action => "update_row" })

  # DELETE
  get("/delete_geography/:id_to_remove", { :controller => "geographies", :action => "destroy_row" })

  #------------------------------

  # Routes for the Location geography resource:

  # CREATE
  get("/location_geographies/new", { :controller => "location_geographies", :action => "new_form" })
  post("/create_location_geography", { :controller => "location_geographies", :action => "create_row" })

  # READ
  get("/location_geographies", { :controller => "location_geographies", :action => "index" })
  get("/location_geographies/:id_to_display", { :controller => "location_geographies", :action => "show" })

  # UPDATE
  get("/location_geographies/:prefill_with_id/edit", { :controller => "location_geographies", :action => "edit_form" })
  post("/update_location_geography/:id_to_modify", { :controller => "location_geographies", :action => "update_row" })

  # DELETE
  get("/delete_location_geography/:id_to_remove", { :controller => "location_geographies", :action => "destroy_row" })

  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
