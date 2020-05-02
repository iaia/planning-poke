class CreateEstimates < ActiveRecord::Migration[6.0]
  def change
    create_table :estimates do |t|
      t.references :issue
      t.integer :point
      t.references :user

      t.timestamps
    end
  end
end
