class AddAdminToBookings < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :Admin, null: false, foreign_key: true
  end
end
20210908043843_add_admin_to_bookings