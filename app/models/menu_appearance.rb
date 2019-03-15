# == Schema Information
#
# Table name: menu_appearances
#
#  id         :integer          not null, primary key
#  recipe_id  :integer
#  menu_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MenuAppearance < ApplicationRecord
    belongs_to :recipe
    belongs_to :menu
    has_many :menu_steps, :dependent => :destroy
end
