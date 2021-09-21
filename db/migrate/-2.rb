class RenameTimeEndToEndTime < ActiveRecord::Migration[6.1]
  def change
    rename_column :bookings, :end_time, :end_time
  end
end
