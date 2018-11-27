class AddAttachmentImageToManuscripts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :manuscripts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :manuscripts, :image
  end
end
