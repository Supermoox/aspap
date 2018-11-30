class Manuscript < ApplicationRecord
  belongs_to :journal
  belongs_to :user
  has_many :reviews, dependent: :destroy


  has_attached_file :image,
   styles: { small: "64x64", medium: "100x100", large: "200x200" }
   validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  has_attached_file :document
    validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }


end
