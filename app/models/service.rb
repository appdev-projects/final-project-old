# == Schema Information
#
# Table name: services
#
#  id         :integer          not null, primary key
#  name       :string
#  crosscover :boolean
#  vacation   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Service < ApplicationRecord
  
  has_many :shifts
  
end
