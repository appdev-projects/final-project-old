# == Schema Information
#
# Table name: signups
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  tourist_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Signup < ApplicationRecord
  validates(:tourist_id, {:presence => true})
  validates(:event_id, {:presence => true})
  
  #direct
  belongs_to :event, :class_name => "Event", :foreign_key => "event_id"
  
  belongs_to :tourist, :class_name => "User", :foreign_key => "tourist_id"
  
  has_many :tourists, :through => :signups, :source => :user
end
