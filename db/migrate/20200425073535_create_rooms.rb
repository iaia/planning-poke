class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
