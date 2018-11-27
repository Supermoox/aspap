class AddUserIdToManuscripts < ActiveRecord::Migration[5.1]
  def change
    add_column :manuscripts, :user_id, :integer
  end
end
