class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  
    
    def index
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
      
      ## loop through each location
      Location.all.each do |location|
        ## reset to 0 for each location
        cityTotal = 0
        relax = 0
        nightlife = 0
        family = 0
        active = 0
        culture = 0
        total = 0
        LocationActivity.where(location_id: location.id).each do |city| ## loop through where each activity in the city
              Activity.where(id: city.activity_id).each do |activity| ## loop through and count each activity in the category (I should have made a database for category and linked but have come this far)
                  if activity.category == "Relax"
                      relax = relax + city.feature_rating
                  end
                  
                  if activity.category == "Night Life"
                      nightlife = nightlife + city.feature_rating
                  end
                  
                  if activity.category == "Family"
                      family = family + city.feature_rating
                  end
                  
                  if activity.category == "Active"
                      active = active + city.feature_rating
                  end
                  
                  if activity.category == "Culture"
                      culture = culture + city.feature_rating
                  end
              end
        end
          
          ##evenly weigh each city
          total = relax + nightlife + family + active + culture
          relax = (relax/total) * 100
          nightlife = (nightlife/total) * 100
          family = (family/total) * 100
          active = (active/total) * 100
          culture = (culture/total) * 100
          
          
          ## weigh based on user preference
          cityTotal = (relax * @relaxMultiplier) + (nightlife * @nightlifeMultiplier) + (family * @familyMultiplier) + (active * @activeMultiplier) + (culture * @cultureMultiplier)
          @ranking.push(location.city_name + " Scored " + cityTotal.to_s)
          @cityRanking.store(location.id,cityTotal.round(2))

      end
      
      render("main/show_results.html.erb")
   
    end
    

  
end
