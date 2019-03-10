# == Schema Information
#
# Table name: buildings
#
#  id                :integer          not null, primary key
#  address           :string
#  neighborhood      :string
#  address_latitude  :float
#  address_longitude :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  name              :string
#

class Building < ApplicationRecord
# Validations
    validates :address, presence: true
    validates :address, uniqueness: true
    validates :name, presence: true
    validates :name, uniqueness: true
    
# Associations
    has_many :building_amenities, :dependent => :destroy
    has_many :apartments, :dependent => :destroy
    has_many :building_bookmarks, :dependent => :destroy
end
