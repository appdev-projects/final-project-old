# == Schema Information
#
# Table name: location_geographies
#
#  id           :integer          not null, primary key
#  geography_id :integer
#  location_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class LocationGeography < ApplicationRecord
    belongs_to :location
    belongs_to :geography 
    
    validates :geography_id, :presence => true
        validates :geography_id, uniqueness: {
        scope: :location_id,
        message: "should be unique with respect to location"
    }   
end
