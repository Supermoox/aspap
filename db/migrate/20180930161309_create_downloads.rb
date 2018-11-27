class CreateDownloads < ActiveRecord::Migration[5.1]
  def change
    create_table :downloads do |t|
      t.string :title

      t.timestamps
    end
  end
end
