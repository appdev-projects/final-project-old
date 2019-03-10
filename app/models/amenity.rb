# == Schema Information
#
# Table name: amenities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Amenity < ApplicationRecord
# Validations
    validates :name, presence: true
# Associations
    has_many :building_amenities, :dependent => :destroy

end
