class AddUserCountToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :user_count, :integer, default: 0, null: false
    add_column :users, :room_id, :bigint
  end
end
