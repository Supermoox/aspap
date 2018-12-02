class AddUserIdToArticomments < ActiveRecord::Migration[5.1]
  def change
    add_column :articomments, :user_id, :integer
  end
end
