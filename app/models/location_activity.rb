# == Schema Information
#
# Table name: location_activities
#
#  id             :integer          not null, primary key
#  location_id    :integer
#  activity_id    :integer
#  feature_rating :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class LocationActivity < ApplicationRecord
    belongs_to :city, :class_name => "Location", :foreign_key => "location_id"
    belongs_to :feature, :class_name => "Activity", :foreign_key => "activity_id" 
end
