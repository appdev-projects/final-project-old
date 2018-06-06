class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  
    
    def index
      @skipNavbar = true
       render("main/index.html.erb")
    end
  
    def search
      render("main/search.html.erb")
   
    end
    
    def results
      
      @relaxMultiplier = params.fetch("relax").to_f
      @nightlifeMultiplier = params.fetch("nightlife").to_f
      @familyMultiplier = params.fetch("family").to_f
      @activeMultiplier = params.fetch("active").to_f
      @cultureMultiplier = params.fetch("culture").to_f
      @ranking = Array.new
      @cityRanking = Hash.new
      @temp = 0
      @cityTotal = 0
      @relax = 0
      @nightlife = 0
      @family = 0
      @active = 0
      @culture = 0
      @total = 0
     
      ## loop through each location
      Location.all.each do |location|
        LocationActivity.where(location_id: location.id).each do |city| ## loop through where each activity in the city
               ## loop through and count each activity in the category (I should have made a database for category and linked but have come this far)
                  if Activity.find(city.activity_id).category == "Relax"
                      @relax += city.feature_rating

                  end
                  
                  if Activity.find(city.activity_id).category == "Night Life"
                      @nightlife += city.feature_rating
                  end
                  
                  if Activity.find(city.activity_id).category == "Family"
                      @family += city.feature_rating
                      if location.city_name == "San Francisco"
                        @temp = @family
                      end
                  end
                  
                  if Activity.find(city.activity_id).category == "Active"
                      @active += city.feature_rating
                  end
                  
                  if Activity.find(city.activity_id).category == "Culture"
                      @culture += city.feature_rating
                  end
        
        
        end
          

          
          ##evenly weigh each city
          @total = @relax + @nightlife + @family + @active + @culture
          @relax = (@relax/@total) * 100
          @nightlife = (@nightlife/@total) * 100
          @family = (@family/@total) * 100
          @active = (@active/@total) * 100
          @culture = (@culture/@total) * 100
          
          
          ## weigh based on user preference
          @cityTotal = (@relax * @relaxMultiplier) + (@nightlife * @nightlifeMultiplier) + (@family * @familyMultiplier) + (@active * @activeMultiplier) + (@culture * @cultureMultiplier)
          @ranking.push(location.city_name + " Scored " + @cityTotal.to_s)
          @cityRanking.store(location.id, @cityTotal.round(2))
          
          ## the numbers look wrong because it is based on the weight not the actual count, so even though san francisco only has a count of 2 for family (as of now) if you weight everything 0 except for family it will be in the number 2 spot because there are only 15 ratings
          
          
        ## reset to 0 for each location
        @cityTotal = 0
        @relax = 0
        @nightlife = 0
        @family = 0
        @active = 0
        @culture = 0
        @total = 0
          

      end
      
      render("main/show_results.html.erb")
   
    end
    

  
end
