class PagesController < ApplicationController
	def index 
		@posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 3)
		@events = Event.order("created_at DESC").first(4)
		@articles = Article.all.where(approve: true).order("created_at DESC").paginate(page: params[:page], per_page: 3)
		@journals = Journal.all
		@pictures = Journal.all
		@directorates = Directorate.all
		@post = Post.new

	end
end
