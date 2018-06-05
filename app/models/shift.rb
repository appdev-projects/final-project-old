# == Schema Information
#
# Table name: shifts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  service_id :integer
#  date       :datetime
#  night      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Shift < ApplicationRecord
  
  belongs_to :user
  belongs_to :service

end
