module BookingsHelper
  def readable_time(time)
    time.strftime("%l:%M %P")
  end

   def get_status
    Booking.statuses.map { |k, v| [k.humanize.titleize, k] }
  end
    
  def booking_status_color(booking)
    if booking.pending?
      return "secondary"
    elsif booking.approved?
      return "success"
    elsif booking.rejected?
      return "danger"
    end
    "warning"
  end

   def booking_can_act?(booking)
    !booking.rejected? and !booking.approved?
  end

 
end
