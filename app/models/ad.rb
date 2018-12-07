# == Schema Information
#
# Table name: ads
#
#  id         :integer          not null, primary key
#  location   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  file       :string
#

class Ad < ApplicationRecord
  mount_uploader :file, AudioUploader
  
  validates :location, :file, presence: true
  
end
