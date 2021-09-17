class SimpleCalendar::WeeklyCalendar < SimpleCalendar::Calendar
  private

  def date_range
    start_date.beginning_of_month..start_date.end_of_month.to_d
  end
end
