class Article < ApplicationRecord
  has_many :articomments, dependent: :destroy
	has_many :reactions, dependent: :destroy
  belongs_to :user
  belongs_to :directorate
  after_create :set_some_values
  acts_as_votable

  # This method associates the attribte ":avatar" with a file attachment
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '270x160>',
    large: '400x400>'
  }
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  private

    def set_some_values
      if self.user.editor || self.user.editor || self.user.vip || self.user.PR
        self.update(approve: true)
      end 
      self.update(counter: 0)
      self.save
    end
end
