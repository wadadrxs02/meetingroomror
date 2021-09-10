class Booking < ApplicationRecord
  belongs_to :admin
  belongs_to :meetingroom
  delegate :name, to: :admin, prefix: true, allow_nil: true
  delegate :name, to: :meetingroom, prefix: true, allow_nil: true
  validates :meetingroom_id, uniqueness: { scope: [:date_book, :time_start, :time_end] }
end
