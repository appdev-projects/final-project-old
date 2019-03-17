# == Schema Information
#
# Table name: apartments
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  description :string
#  floor_plan  :string
#  building_id :integer
#  bedrooms    :integer
#  bathrooms   :integer
#  sq_footage  :integer
#  orientation :string
#  floor       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  rent        :integer
#

class Apartment < ApplicationRecord

# Validations    
    validates :building_id, :user_id, :bedrooms, :bathrooms, :rent, :sq_footage, :floor, presence: true
    validates :bedrooms, :bathrooms, :rent, :sq_footage, :floor, numericality: true
    validates :floor, numericality: { only_integer: true }

# Direct Associations
    belongs_to :user
    has_many :apartment_photos, :dependent => :destroy
    has_many :apartment_bookmarks, :dependent => :destroy
    has_many :apartment_comments, :dependent => :destroy
    has_many :furniture_packs
    belongs_to :building
    
end
