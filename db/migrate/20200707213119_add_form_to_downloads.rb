class AddFormToDownloads < ActiveRecord::Migration[5.1]
  def change
    add_column :downloads, :form, :boolean, default: false
  end
end
