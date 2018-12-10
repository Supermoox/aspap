class Search < ApplicationRecord
	
	def find_manuscripts
		manuscripts = Manuscript.all
		manuscripts = manuscripts.where("title ILIKE ?", "%#{keywords}%") if keywords.present?
		return manuscripts
	end	

	def find_users
		users = User.all
		users = users.where("username ILIKE ?", "%#{keywords}%") if keywords.present?
		return users
	end

	def find_articles
		articles = Article.all
		articles = articles.where("title ILIKE ?", "%#{keywords}%") if keywords.present?
		return articles
	end

	def find_posts
		posts = Post.all
		posts = posts.where("title ILIKE ?", "%#{keywords}%") if keywords.present?
		return posts
	end

end
