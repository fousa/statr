require "spec_helper"

describe CalendarHelper do
  before(:each) do
    @date = Time.local(2011, 01)
  end

  it "should return the path to the previous month" do
    previous_calendar_path(@date).should match "/calendar/2010/12"
  end

  it "should return the path to the next month" do
    next_calendar_path(@date).should match "/calendar/2011/02"
  end
end
