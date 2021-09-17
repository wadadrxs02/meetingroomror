module BookingsHelper
  def readable_time(time)
    time.strftime("%l:%M %P")
  end
end
