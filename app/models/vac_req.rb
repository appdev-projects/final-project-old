# == Schema Information
#
# Table name: vac_reqs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  start_date :datetime
#  end_date   :datetime
#  approval   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VacReq < ApplicationRecord
  
  validates :start_date, presence: true
  validates :start_date, uniqueness: {scope: :user_id}
  validates :end_date, presence: true
  
  # Format for making custom validations
  validate :submit_4_months_before_start_date
    def submit_4_months_before_start_date
      if  id.present?
        if created_at + 96.days > start_date
          errors.add(:start_date, "Must be more than 4 months (96 days) from Submit Date")
        end
      else
        if DateTime.now + 96.days > start_date
          errors.add(:start_date, "Must be more than 4 months (96 days) from Submit Date")
        end
      end
    end
  # End custom validation
  
  belongs_to :user
  
end
