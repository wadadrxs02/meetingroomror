class ChangeStartTimeToBeDatetimeInBookings < ActiveRecord::Migration[6.1]
  def up
    change_column :bookings, :start_time, :datetime
  end

  def down
    change_column :bookings, :start_time, :time
  end
end
