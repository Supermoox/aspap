class Article < ApplicationRecord
	has_many :articomments, dependent: :destroy
  belongs_to :user
  after_create :approve

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  private

    def approve
      if self.user.editor || self.user.editor || self.user.vip || self.user.PR
        self.update(approve: true)
        self.save
      end 
    end
end
