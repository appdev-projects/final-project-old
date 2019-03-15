# == Schema Information
#
# Table name: menu_steps
#
#  id                 :integer          not null, primary key
#  step_id            :integer
#  menu_appearance_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class MenuStep < ApplicationRecord
    belongs_to :step
    belongs_to :menu_appearance
    has_one :menu, :through => :menu_appearance, :source => :menu
end
