class AddUserIdToArtireplies < ActiveRecord::Migration[5.1]
  def change
    add_column :artireplies, :user_id, :integer
  end
end
