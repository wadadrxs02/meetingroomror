class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :title
      t.date :date_book
      t.time :time_start
      t.time :time_end
      t.integer :pax
      t.references :user, null: false, foreign_key: true
      t.references :meetingroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
