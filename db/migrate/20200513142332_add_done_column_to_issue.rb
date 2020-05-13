class AddDoneColumnToIssue < ActiveRecord::Migration[6.0]
  def change
    add_column :issues, :done, :boolean, default: false, null: false
  end
end
