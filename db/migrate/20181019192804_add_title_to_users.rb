class AddTitleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :title, :integer
  end
end
