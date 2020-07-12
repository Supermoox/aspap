class AddAttachmentCardToMemberships < ActiveRecord::Migration[5.1]
  def self.up
    change_table :memberships do |t|
      t.attachment :card
    end
  end

  def self.down
    remove_attachment :memberships, :card
  end
end
