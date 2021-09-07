class PartialController < ApplicationController
  def index
    @meetingrooms = Meetingroom.all
  end
end
