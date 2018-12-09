class Directorate < ApplicationRecord
	has_many :researches
	has_many :articles
	has_many :posts
end
