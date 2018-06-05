# == Schema Information
#
# Table name: location_weathers
#
#  id          :integer          not null, primary key
#  location_id :integer
#  month       :string
#  temperature :integer
#  weather     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LocationWeather < ApplicationRecord
    belongs_to :location
end
