class AddArticleIdToReactions < ActiveRecord::Migration[5.1]
  def change
    add_column :reactions, :article_id, :integer
  end
end
