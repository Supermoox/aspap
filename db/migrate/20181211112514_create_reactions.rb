class CreateReactions < ActiveRecord::Migration[5.1]
  def change
    create_table :reactions do |t|
      t.boolean :recomend

      t.timestamps
    end
  end
end
