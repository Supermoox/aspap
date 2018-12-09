class AddDirectorateIdToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :directorate_id, :integer
  end
end
