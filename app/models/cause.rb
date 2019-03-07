# == Schema Information
#
# Table name: causes
#
#  id             :integer          not null, primary key
#  description    :string
#  name           :string
#  goal_amount    :string
#  current_amount :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Cause < ApplicationRecord
  has_many :memberships, :dependent => :destroy

end
