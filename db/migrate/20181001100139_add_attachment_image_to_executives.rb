class AddAttachmentImageToExecutives < ActiveRecord::Migration[5.1]
  def self.up
    change_table :executives do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :executives, :image
  end
end
