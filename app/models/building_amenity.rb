# == Schema Information
#
# Table name: building_amenities
#
#  id          :integer          not null, primary key
#  building_id :integer
#  amenity_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class BuildingAmenity < ApplicationRecord
# Validations
    validates :building_id, :amenity_id, presence: true

# Associations
    belongs_to :amenity
    belongs_to :building
    has_many :amenity_pictures, :dependent => :destroy
end
