class AddUuidColumnToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :uuid, :string
  end
end
