# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  city        :string
#  event_name  :string
#  date        :date
#  description :text
#  host_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ApplicationRecord
  validates(:host_id, {:presence => true})
  validates(:event_name, {:presence => true})
  validates(:city, {:presence => true})
  validates(:date, {:presence => true})
  belongs_to :user, :class_name => "User", :foreign_key => "host_id"
  has_many :participants, :through => :signups, :source => :user
end
