class AddCounterToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :counter, :integer
  end
end
