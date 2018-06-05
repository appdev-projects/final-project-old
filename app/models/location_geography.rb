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
end
