class ChangeAdminIdToUserIdAtBooking < ActiveRecord::Migration[6.1]
  def change
    rename_column :bookings, :admin_id, :user_id
  end
end
