class Editor < ApplicationRecord
	belongs_to :user
	enum request: [:editor, :peer_reviewer, :publisher, :verify_my_account]
end
