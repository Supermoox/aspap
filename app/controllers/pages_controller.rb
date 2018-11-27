class PagesController < ApplicationController
	def index 
		@posts = Post.last(4)
		@events = Event.last(4)
		@articles = Article.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
		@journals = Journal.all
	end
end
