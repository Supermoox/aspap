class CreateDirectorates < ActiveRecord::Migration[5.1]
  def change
    create_table :directorates do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
