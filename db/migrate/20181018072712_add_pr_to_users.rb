class AddPrToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :PR, :boolean
  end
end
