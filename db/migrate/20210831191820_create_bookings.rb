class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.integer :pax
      t.references :admin, null: false, foreign_key: true
      t.references :meetingroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
