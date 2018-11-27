class CreateExecutives < ActiveRecord::Migration[5.1]
  def change
    create_table :executives do |t|
      t.string :name
      t.string :position
      t.string :expertise
      t.string :research_interest
      t.string :education
      t.text :description

      t.timestamps
    end
  end
end
