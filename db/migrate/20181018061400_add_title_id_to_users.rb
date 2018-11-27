class AddTitleIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :title_id, :integer
  end
end
