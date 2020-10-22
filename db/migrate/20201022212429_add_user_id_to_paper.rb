class AddUserIdToPaper < ActiveRecord::Migration[5.1]
  def change
    add_column :papers, :user_id, :integer
  end
end
