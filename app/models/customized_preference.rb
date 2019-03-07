# == Schema Information
#
# Table name: customized_preferences
#
#  id                 :integer          not null, primary key
#  event_id           :integer
#  user_id            :integer
#  transaction_amount :float
#  goal_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class CustomizedPreference < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  belongs_to :event
end
