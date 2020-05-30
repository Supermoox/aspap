class PagesController < ApplicationController
	def index 
		@posts = Post.all.order("created_at").last(4)
		@events = Event.order("created_at DESC").first(4)
		@articles = Article.all.where(approve: true).order("created_at DESC").paginate(page: params[:page], per_page: 6)
		@journals = Journal.all
	end
end
