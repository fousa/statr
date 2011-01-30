module CalendarHelper
  def previous_calendar_path(date)
    date = date.beginning_of_month - 1
    month_path(date)
  end

  def next_calendar_path(date)
    date = date.end_of_month + 1
    month_path(date)
  end

  protected

  def month_path(date)
    calendar_for_month_path(date.year, "%02d" % date.month)
  end
end
