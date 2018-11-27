class Search < ApplicationRecord
	def find_manuscripts
		manuscripts = Manuscript.all
		manuscripts = manuscripts.where("title LIKE ?", "%#{keywords}%") if keywords.present?
		manuscripts = manuscripts.where(journal_id: journal_id) if journal_id.present?
		return manuscripts
	end
end
