class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  
    
    def index
       render("main/index.html.erb")
    end
  
    def calculate

   
        
            
            
        
        @culture
        @nightlife
        @family
        @relax
    
    
    
    
    end
    
  
  
end
