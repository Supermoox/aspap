class Journal < ApplicationRecord
	has_many :manuscripts, dependent: :destroy
end
