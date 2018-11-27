class AddAttachmentDocumentToManuscripts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :manuscripts do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :manuscripts, :document
  end
end
