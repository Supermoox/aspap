class Manuscript < ApplicationRecord
  belongs_to :journal
  belongs_to :user
  has_many :reviews, dependent: :destroy


	has_attached_file :image,
	 styles: { small: "64x64", medium: "100x100", large: "200x200" },
	 :s3_protocol => 'https',
	 :s3_host_name => ENV['S3_HOST_NAME'],
	 :path => ENV['S3_PATH'],
	 :storage => 's3',
	 :s3_region => ENV['AWS_REGION']

	 validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  

	has_attached_file :document,
	 :s3_protocol => 'https',
	 :s3_host_name => ENV['S3_HOST_NAME'],
	 :path => ENV['S3_PATH'],
	 :storage => 's3',
	 :s3_region => ENV['AWS_REGION']
	 validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }


end
