class AddDescriptionToJournals < ActiveRecord::Migration[5.1]
  def change
    add_column :journals, :description, :text
  end
end
