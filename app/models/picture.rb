class Picture < ApplicationRecord 
 	has_attached_file :image,
	 styles: { small: "64x64", medium: "500x500", large: "600x600" },
	 :s3_protocol => 'https',
	 :s3_host_name => ENV['S3_HOST_NAME'],
	 :path => ENV['S3_PATH'],
	 :storage => 's3',
	 :s3_region => ENV['AWS_REGION']

	 validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
