class AddApproveToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :approve, :boolean
  end
end
