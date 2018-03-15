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
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  username               :string
#  avatar_url             :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, :presence => true, :uniqueness => true
  
  #direct
  has_many :events, :class_name => "Event", :foreign_key => "host_id"
  has_many :signups, :class_name => "Signup", :foreign_key => "tourist_id"
  # looking up the columns in the Signup table has_many :movies, :class_name => "Movie", :foreign_key => "director_id"
  # has_many :events, :source => :event
  # has_many :signups, :source =>:signup
  
  #indirect
  has_many :plans, :through => :signups, :source => :event

end
