class CreateManuscripts < ActiveRecord::Migration[5.1]
  def change
    create_table :manuscripts do |t|
      t.string :title
      t.references :journal, foreign_key: true
      t.text :abstract
      t.boolean :approval

      t.timestamps
    end
  end
end
