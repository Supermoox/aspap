class AddDesciptionToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :description, :text
  end
end
