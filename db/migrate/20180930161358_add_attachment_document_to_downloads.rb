class AddAttachmentDocumentToDownloads < ActiveRecord::Migration[5.1]
  def self.up
    change_table :downloads do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :downloads, :document
  end
end
