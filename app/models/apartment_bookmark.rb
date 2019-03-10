# == Schema Information
#
# Table name: apartment_bookmarks
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  apartment_id :integer
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ApartmentBookmark < ApplicationRecord
# Validations    
    validates :apartment_id, :user_id, presence: true

# Associations
    belongs_to :user
    belongs_to :apartment
    
end
