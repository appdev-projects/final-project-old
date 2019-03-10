# == Schema Information
#
# Table name: building_bookmarks
#
#  id          :integer          not null, primary key
#  building_id :integer
#  user_id     :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class BuildingBookmark < ApplicationRecord
# Validations
    validates :building_id, :user_id, presence: true

# Associations
    belongs_to :user
    belongs_to :building
end
