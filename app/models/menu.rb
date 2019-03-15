# == Schema Information
#
# Table name: menus
#
#  id                     :integer          not null, primary key
#  user_id                :integer
#  name                   :string
#  servings               :integer
#  target_completion_time :time
#  description            :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Menu < ApplicationRecord
    belongs_to :user, :required => false
    has_many :menu_appearances, :dependent => :destroy
    has_many :recipes, :through => :menu_appearances, :source => :recipe
    has_many :menu_steps, :through => :menu_appearances, :source => :menu_steps
has_many :steps, :through => :menu_steps, :source => :step
end
