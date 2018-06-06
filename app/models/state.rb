# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class State < ApplicationRecord
end
