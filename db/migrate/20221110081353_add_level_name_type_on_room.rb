class AddLevelNameTypeOnRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :meetingrooms, :level, :integer
    add_column :meetingrooms, :room_type, :integer
  end
end
