# == Schema Information
#
# Table name: steps
#
#  id              :integer          not null, primary key
#  recipe_id       :integer
#  active          :integer
#  equipment_used  :text
#  sequence_number :integer
#  time_length     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  description     :text
#

class Step < ApplicationRecord
    belongs_to :recipe
    has_many :menu_steps, :dependent => :destroy
    has_many :menus, :through => :menu_steps, :source => :menu
end
