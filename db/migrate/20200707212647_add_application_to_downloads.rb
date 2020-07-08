class AddApplicationToDownloads < ActiveRecord::Migration[5.1]
  def change
    add_column :downloads, :application, :boolean, default: true
  end
end
