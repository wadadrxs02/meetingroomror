class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]
  helper_method :booking
  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
    @bookings = Booking.where(start: params[:start_time]..params[:end_time])
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
     today_start = DateTime.now
     today_end = DateTime.now
    @today1 = today_start.strftime("%d/%m/%Y %I:15 %P") 
    @today2 = today_end.strftime("%d/%m/%Y %I:45 %P") 
     @ttoday = @today1 +' - '+ @today2
  end
  # GET /bookings/1/edit
  def edit

    start_time = @booking.start_time
    end_time = @booking.end_time
    @today1 = start_time.strftime("%d/%m/%Y %I:15 %P") 
    @today2 = end_time.strftime("%d/%m/%Y %I:45 %P") 
    @ttoday = @today1 +' - '+ @today2
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)

    datetime_range = params[:booking][:datetime_range]
    split = datetime_range.split(" - ")
    start_time_raw = split[0]
    end_time_raw = split[1]
    start_time = Time.parse(start_time_raw)
    end_time = Time.parse(end_time_raw)

    @booking.start_time = start_time
    @booking.end_time = end_time

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to "/", notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:title, :start_time, :end_time, :pax, :user_id, :meetingroom_id)
  end

  def start_time
    self.booking.start ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
