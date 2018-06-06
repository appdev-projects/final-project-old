# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  activity   :string
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Activity < ApplicationRecord
    
    validates :activity, :presence => true
    validates :activity, :uniqueness => true
    
    validates :category, :presence => true

    
    has_many :location_features, :class_name => "LocationActivity", :dependent => :destroy 
    has_many :cities, :through => :location_features, :source => :city 
end
