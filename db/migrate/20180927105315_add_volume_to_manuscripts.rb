class AddVolumeToManuscripts < ActiveRecord::Migration[5.1]
  def change
    add_column :manuscripts, :volume, :integer
  end
end
