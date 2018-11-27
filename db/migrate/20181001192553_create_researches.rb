class CreateResearches < ActiveRecord::Migration[5.1]
  def change
    create_table :researches do |t|
      t.string :topic
      t.string :Research_area
      t.text :description
      t.references :directorate, foreign_key: true

      t.timestamps
    end
  end
end
