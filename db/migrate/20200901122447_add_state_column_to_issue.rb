class AddStateColumnToIssue < ActiveRecord::Migration[6.0]
  def change
    add_column :issues, :state, :string
  end
end
