json.extract! booking, :id, :title, :date_book, :time_start, :time_end, :pax, :user_id, :meetingroom_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
