class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :meetingroom
  delegate :name, to: :user, prefix: true, allow_nil: true
  delegate :name, to: :meetingroom, prefix: true, allow_nil: true
  validates :meetingroom_id, uniqueness: { scope: [:start_time, :end_time] }
end
