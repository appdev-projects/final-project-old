# == Schema Information
#
# Table name: recipes
#
#  id            :integer          not null, primary key
#  title         :string
#  number_served :integer
#  user_id       :integer
#  description   :text
#  total_time    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Recipe < ApplicationRecord
    belongs_to :user, :required => false
    has_many :menu_appearances, :dependent => :destroy
    has_many :steps, :dependent => :destroy
    has_many :menus, :through => :menu_appearances, :source => :menu
end
