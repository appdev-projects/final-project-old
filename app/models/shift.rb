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
  
  # Unable to double book resident to 2 services on same shift
  validates :user_id, uniqueness: { :scope => [ :date , :night ] , message: "Resident already scheduled for that shift!" }
  
  # # Custom Validation, unable to book resident working 14 days in a row
  validate :consecutive_days
    def consecutive_days
        @start = (date - 13.days).to_datetime
        @end = date
        @shifts = Shift.where(user_id: user_id)
        @shifts = @shifts.where("date > ?", @start)
        @shifts = @shifts.where("date < ?", @end)
        if @shifts.count > 13
          errors.add(:consecutive_days, "Duty Hour Violation")
        end
    end
  # # End custom validation
  
  # # Custom Validation, unable to book resident for more than 36 hours
  validate :consecutive_shifts
    def consecutive_shifts
        @start = (date - 2.days).to_datetime
        @shifts = Shift.where(date: @start)
        @shifts = @shifts.where(user_id: user_id)
        if @shifts.count > 2
          errors.add(:consecutive_shifts, "Duty Hour Violation")
        end
    end
  # # End custom validation
  
  belongs_to :user
  belongs_to :service

end
