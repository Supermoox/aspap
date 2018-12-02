class CreateArticomments < ActiveRecord::Migration[5.1]
  def change
    create_table :articomments do |t|
      t.text :body
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
