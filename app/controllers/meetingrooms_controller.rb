class MeetingroomsController < ApplicationController
  before_action :set_meetingroom, only: %i[ show edit update destroy ]
  # GET /meetingrooms or /meetingrooms.json
  def index
    @meetingrooms = Meetingroom.all
  end

  # GET /meetingrooms/1 or /meetingrooms/1.json
  def show
    @meetingrooms = Meetingroom.all
    @bookings = @meetingroom.bookings
  end

  # GET /meetingrooms/new
  def new
    @meetingroom = Meetingroom.new
  end

  # GET /meetingrooms/1/edit
  def edit
  end

  # POST /meetingrooms or /meetingrooms.json
  def create
    @meetingroom = Meetingroom.new(meetingroom_params)

    respond_to do |format|
      if @meetingroom.save
        format.html { redirect_to "/", notice: "Meeting Room was successfully created." }
        format.json { render :show, status: :created, location: @meetingroom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meetingroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetingrooms/1 or /meetingrooms/1.json
  def update
    respond_to do |format|
      if @meetingroom.update(meetingroom_params)
        format.html { redirect_to @meetingroom, notice: "Meeting Room was successfully updated." }
        format.json { render :show, status: :ok, location: @meetingroom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meetingroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetingrooms/1 or /meetingrooms/1.json
  def destroy
    @meetingroom.destroy
    respond_to do |format|
      # meetingrooms_url
      format.html { redirect_to "/", notice: "Meeting Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meetingroom
    @meetingroom = Meetingroom.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def meetingroom_params
    params.require(:meetingroom).permit(:name, :capacity, :image, :level, :type)
  end

  def start_date
    self.meetingroom.start_date.beginning_of_month
  end

  def end_time
    self.meetingroom.end_date.to_datetime
  end

  def date_range
    start_date.beginning_of_month..start_date.end_of_month
  end
end
