class Articomment < ApplicationRecord
  belongs_to :article
  has_many :artireplies, dependent: :destroy
  belongs_to :user
end
