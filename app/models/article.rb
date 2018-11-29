class Article < ApplicationRecord
  belongs_to :user


	has_attached_file :image,
	 styles: { small: "64x64", med: "100x100", large: "200x200" },
	 :s3_protocol => 'https',
	 :s3_host_name => ENV['S3_HOST_NAME'],
	 :path => ENV['S3_PATH'],
	 :storage => 's3',
	 :s3_region => ENV['AWS_REGION']

	 validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
