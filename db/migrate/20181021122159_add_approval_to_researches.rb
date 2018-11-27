class AddApprovalToResearches < ActiveRecord::Migration[5.1]
  def change
    add_column :researches, :approval, :boolean
  end
end
