class AddIssueToManuscripts < ActiveRecord::Migration[5.1]
  def change
    add_column :manuscripts, :issue, :integer
  end
end
