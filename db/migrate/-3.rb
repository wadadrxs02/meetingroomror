class ChangeEndTimeToBeDatetimeInBookings < ActiveRecord::Migration[6.1]
  def up
    change_column :bookings, :end_time, :datetime
  end

  def down
    change_column :bookings, :end_time, :time
  end
end
