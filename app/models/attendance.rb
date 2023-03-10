class Attendance < ApplicationRecord
    belongs_to :user
    belongs_to :event
    after_create :attendance_send

    def attendance_send
        AttendanceMailer.attendance_email(self).deliver_now
      end

end
