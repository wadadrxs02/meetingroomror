json.extract! booking, :id, :title, :start_time, :end_time, :pax, :user_id, :meetingroom_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)

date_format = booking.all_day_booking? ? "%Y-%m-%d" : "%Y-%m-%dT%H:%M:%S"

json.id booking.id
json.title booking.title
json.start_time booking.start_time.strftime(date_format)
json.end_time booking.end_time.strftime(date_format)

json.color booking.color unless booking.color.blank?
json.allDay booking.all_day_booking? ? true : false

json.update_url booking_path(booking, method: :patch)
json.edit_url edit_booking_path(booking)
