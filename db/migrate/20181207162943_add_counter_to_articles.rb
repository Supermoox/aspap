class AddCounterToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :counter, :integer
  end
end
