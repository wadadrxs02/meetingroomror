class Meetingroom < ApplicationRecord
    has_many :bookings, dependent: :destroy
end
