class AddUserIdToDownloads < ActiveRecord::Migration[5.1]
  def change
    add_column :downloads, :user_id, :integer
  end
end
