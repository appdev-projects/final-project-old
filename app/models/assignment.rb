# == Schema Information
#
# Table name: assignments
#
#  id         :integer          not null, primary key
#  block_id   :integer
#  user_id    :integer
#  service_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Assignment < ApplicationRecord
  
  validates :block_id, uniqueness: { scope: :user_id,
    message: "Resident is already assigned for Block" }
  
end
