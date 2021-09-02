class HomeController < ApplicationController
  def index
    @meetingrooms = Meetingroom.all
  end


end
