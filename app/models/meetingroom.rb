class Meetingroom < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :capacity, presence: true
  validates :level, presence: true
  validates :room_type, presence: true
  
  has_one_attached :image, dependent: :destroy

  enum room_type: { :lab => 1, :class_room => 2 }

end
