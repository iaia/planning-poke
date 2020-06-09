class AddCloseTimeColumnToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :closed_at, :datetime, null: false, default: DateTime.now
  end
end
