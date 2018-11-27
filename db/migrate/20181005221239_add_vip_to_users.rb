class AddVipToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :vip, :boolean
  end
end
