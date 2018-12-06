# == Schema Information
#
# Table name: podcasts
#
#  id                  :integer          not null, primary key
#  title               :string
#  episode             :string
#  podcast_description :text
#  episode_description :text
#  cover               :string
#  first_part          :string
#  second_part         :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Podcast < ApplicationRecord
  
  mount_uploader :first_part, AudioUploader
  mount_uploader :second_part, AudioUploader
  
end
