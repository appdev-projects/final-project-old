Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get("/", { :controller => "game", :action => "home"})
 
  get("/restart", { :controller => "game", :action => "restart"})
  
  post("/player_move", {:controller => "game", :action => "player_move"})
  
  #post("/update_photo/:id_to_modify", { :controller => "photos", :action => "update_row" })

end