# == Schema Information
#
# Table name: events
#
#  id               :integer          not null, primary key
#  name             :string
#  description      :string
#  logic            :string
#  frequency        :string
#  suggested_amount :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Event < ApplicationRecord
  has_many :customized_preferences, :dependent => :destroy

end
