# == Schema Information
#
# Table name: apartment_photos
#
#  id           :integer          not null, primary key
#  description  :string
#  apartment_id :integer
#  photo        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ApartmentPhoto < ApplicationRecord
  mount_uploader :photo, PhotoUploader

# Validations
    validates :apartment_id, :photo, presence: true

# Direct Associations
    belongs_to :apartment

end
