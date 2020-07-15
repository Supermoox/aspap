class Membership < ApplicationRecord
	belongs_to :user
	enum kind: [:Student, :Proffesional, :Executive]

  has_attached_file :card, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :card, :content_type => /\Aimage\/.*\Z/


end
