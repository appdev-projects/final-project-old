# == Schema Information
#
# Table name: geographies
#
#  id         :integer          not null, primary key
#  geography  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Geography < ApplicationRecord
    has_many :location_geographies, :dependent => :destroy
    has_many :locations, :through => :location_geographies, :source => :location 
end
