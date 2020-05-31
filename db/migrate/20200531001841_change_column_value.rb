class ChangeColumnValue < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :verified, :boolean, default: false
  end
end
