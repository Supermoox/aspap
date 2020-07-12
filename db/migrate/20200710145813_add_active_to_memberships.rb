class AddActiveToMemberships < ActiveRecord::Migration[5.1]
  def change
    add_column :memberships, :active, :boolean, null: false, default: true
  end
end
