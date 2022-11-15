class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :meetingroom
  has_one :approval
  delegate :name, to: :user, prefix: true, allow_nil: true
  delegate :name, to: :meetingroom, prefix: true, allow_nil: true
  validates :pax, presence: true
  validates :title, presence: true
  validates :meetingroom, presence: true

  validates :meetingroom_id, uniqueness: { scope: [:start_time, :end_time] }
  enum status: { :pending => 0, :approved => 10, :rejected => 100}

end
