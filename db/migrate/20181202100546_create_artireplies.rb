class CreateArtireplies < ActiveRecord::Migration[5.1]
  def change
    create_table :artireplies do |t|
      t.text :body
      t.references :articomment, foreign_key: true

      t.timestamps
    end
  end
end
