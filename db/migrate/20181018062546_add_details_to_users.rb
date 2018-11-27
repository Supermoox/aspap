class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :firstname, :string
    add_column :users, :middlename, :string
    add_column :users, :surname, :string
    add_column :users, :phone, :string
    add_column :users, :placeOfWork, :string
  end
end
