class AddKindToMemberships < ActiveRecord::Migration[5.1]
  def change
    add_column :memberships, :kind, :integer
  end
end
