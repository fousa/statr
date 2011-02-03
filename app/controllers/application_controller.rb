class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_date(year = nil, month = nil)
    return Time.zone.now if year.nil? || month.nil?

    Time.zone.local(year, month)
  end
end
