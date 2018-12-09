class Search < ApplicationRecord
	
	def find_manuscripts
		manuscripts = Manuscript.all
		manuscripts = manuscripts.where("title LIKE ?", "%#{keywords}%") if keywords.present?
		manuscripts = manuscripts.where(journal_id: journal_id) if journal_id.present?
		return manuscripts
	end	

	def find_users
		users = User.all
		users = users.where("username LIKE ?", "%#{keywords}%") if keywords.present?
		return users
	end

	def find_articles
		articles = Article.all
		articles = articles.where("title LIKE ?", "%#{keywords}%") if keywords.present?
		return articles
	end

	def find_posts
		posts = Post.all
		posts = posts.where("title LIKE ?", "%#{keywords}%") if keywords.present?
		return posts
	end

end
