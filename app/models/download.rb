class Download < ApplicationRecord
	has_attached_file :document,
	 :s3_protocol => 'https',
	 :s3_host_name => ENV['S3_HOST_NAME'],
	 :path => ENV['S3_PATH'],
	 :storage => 's3',
	 :s3_region => ENV['AWS_REGION']
	 validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
	 
end
