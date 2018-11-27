class AddRequestToEditors < ActiveRecord::Migration[5.1]
  def change
    add_column :editors, :request, :integer
  end
end
