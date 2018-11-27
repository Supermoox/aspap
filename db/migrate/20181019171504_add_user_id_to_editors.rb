class AddUserIdToEditors < ActiveRecord::Migration[5.1]
  def change
    add_column :editors, :user_id, :integer
  end
end
