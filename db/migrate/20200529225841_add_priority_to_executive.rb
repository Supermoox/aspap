class AddPriorityToExecutive < ActiveRecord::Migration[5.1]
  def change
    add_column :executives, :priority, :integer
  end
end
