class Review < ApplicationRecord
	belongs_to :user
	belongs_to :manuscript
end
