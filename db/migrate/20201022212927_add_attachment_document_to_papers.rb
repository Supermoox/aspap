class AddAttachmentDocumentToPapers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :papers do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :papers, :document
  end
end
