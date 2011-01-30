require "spec_helper"

describe CalendarController do
  describe "routes" do
    it "generates a correct calendar route" do
      url  = { :get => "/calendar/2011/02" }
      hash = { :controller => "calendar",
               :action     => "show",
               :year       => "2011",
               :month      => "02" }

      url.should be_routable
      url.should route_to(hash)
    end

    it "can not route" do
      url = { :get => "/calendar/2011" }
      url.should_not be_routable

      url = { :get => "/calendar/2011/2" }
      url.should_not be_routable
      
      url = { :get => "/calendar/201" }
      url.should_not be_routable
    end
  end
end
