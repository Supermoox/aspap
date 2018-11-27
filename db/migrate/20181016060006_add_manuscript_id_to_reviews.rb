class AddManuscriptIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :manuscript_id, :integer
  end
end
