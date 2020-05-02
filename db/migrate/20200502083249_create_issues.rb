class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.references :room
      t.string :issue_number, null: false

      t.timestamps
    end
  end
end
