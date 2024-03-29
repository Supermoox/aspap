class Download < ApplicationRecord
	belongs_to :user
	enum status: [:Pending, :Accepted, :Rejected]

  has_attached_file :document
    validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
	 
end
