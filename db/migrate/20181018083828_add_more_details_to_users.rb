class AddMoreDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :institution, :string
    add_column :users, :field, :string
    add_column :users, :qualification, :integer
    add_column :users, :year_completed, :datetime
  end
end
