class AddConcludedToResearches < ActiveRecord::Migration[5.1]
  def change
    add_column :researches, :concluded, :boolean
  end
end
