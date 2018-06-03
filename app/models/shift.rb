# == Schema Information
#
# Table name: shifts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  service_id :integer
#  date       :datetime
#  night      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Shift < ApplicationRecord
  
  # # Format for making custom validations
  validate :work_hours
    def work_hours
        @start = (date - 13.days).to_datetime
        @end = date
        @shifts = Shift.where("date > ?", @start)
        @shifts = @shifts.where("date < ?", @end)
        if @shifts.count > 13
          errors.add(:work_hours, "Be aware of potential duty hour violation")
        end
    end
  # # End custom validation
  
  belongs_to :user
  belongs_to :service

end
