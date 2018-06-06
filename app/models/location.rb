# == Schema Information
#
# Table name: locations
#
#  id           :integer          not null, primary key
#  city_name    :string
#  state_name   :string
#  country_name :string
#  lat          :float
#  long         :float
#  image        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Location < ApplicationRecord
    validates :city_name, :presence => true
    validates :city_name, uniqueness: {
        scope: :state_name,
        message: "should be unique with respect to state"
    }
    
    validates :state_name, :presence => true

   validates :country_name, :presence => true
   
    validates :lat, :uniqueness => true
        
    validates :long, :uniqueness => true
    
    validates :image, :presence => true
    validates :image, :uniqueness => true    
    
    
    has_many :location_weathers, :dependent => :destroy
    has_many :location_features, :class_name => "LocationActivity", :dependent => :destroy
    has_many :location_geographies, :dependent => :destroy 
    
    has_many :features, :through => :location_features, :source => :feature
    has_many :geographies, :through => :location_geographies, :source => :geography 
end
