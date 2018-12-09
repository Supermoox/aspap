class AddDirectorateIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :directorate_id, :integer
  end
end
