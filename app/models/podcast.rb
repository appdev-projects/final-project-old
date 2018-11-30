# == Schema Information
#
# Table name: podcasts
#
#  id          :integer          not null, primary key
#  title       :string
#  first_part  :string
#  second_part :string
#  cover       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Podcast < ApplicationRecord
end
