class HomeController < ApplicationController
  def index
    @meetingroom = Meetingroom.all
  end
end
