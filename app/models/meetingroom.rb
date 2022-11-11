class Meetingroom < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  has_one_attached :image, dependent: :destroy
end
