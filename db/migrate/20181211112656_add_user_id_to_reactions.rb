class AddUserIdToReactions < ActiveRecord::Migration[5.1]
  def change
    add_column :reactions, :user_id, :integer
  end
end
