class Manuscript < ApplicationRecord
	has_attached_file :document
	validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

	has_attached_file :image, styles: { medium: "500x500>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :journal
  belongs_to :user
  has_many :reviews, dependent: :destroy
end
