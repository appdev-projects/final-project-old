# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord

# Validations
  validates :username, :uniqueness => true
  validates :username, :presence => true
  validates :email, :uniqueness => true

# Associations
  has_many :apartments, :dependent => :destroy
  
  has_many :bookmarked_apartments, :through => :apartment_bookmarks, :source => :apartment
  has_many :bookmarked_buildings, :through => :building_bookmarks, :source => :building
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
end
