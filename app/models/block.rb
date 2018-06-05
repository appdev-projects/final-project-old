# == Schema Information
#
# Table name: blocks
#
#  id         :integer          not null, primary key
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  number     :integer
#  year       :integer
#

class Block < ApplicationRecord
end
