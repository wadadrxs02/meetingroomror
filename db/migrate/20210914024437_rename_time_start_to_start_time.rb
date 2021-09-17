class RenameTimeStartToStartTime < ActiveRecord::Migration[6.1]
  def change
    rename_column :bookings, :start_time, :start_time
  end
end
