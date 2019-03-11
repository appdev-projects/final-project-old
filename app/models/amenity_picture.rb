# == Schema Information
#
# Table name: amenity_pictures
#
#  id                  :integer          not null, primary key
#  picture             :string
#  description         :string
#  building_amenity_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class AmenityPicture < ApplicationRecord
  mount_uploader :picture, PictureUploader

# Validations
    validates :building_amenity_id, :picture, presence: true
# Associations
    belongs_to :building_amenity
    
end
