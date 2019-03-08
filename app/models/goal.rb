# == Schema Information
#
# Table name: goals
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  description    :string
#  name           :string
#  d_or_s         :boolean
#  goal_amount    :string
#  current_amount :string
#  deadline       :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Goal < ApplicationRecord
  
  belongs_to :user
  has_many :customized_preferences, :dependent => :destroy

  validates :name, :presence => true
  validates :goal_amount, :presence => true
   



end
