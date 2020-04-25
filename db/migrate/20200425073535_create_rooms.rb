class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :uuid, null: false
      t.string :name, null: false
      t.string :password_digdest, null: false

      t.timestamps

      t.index :uuid, unique: true
    end
  end
end
