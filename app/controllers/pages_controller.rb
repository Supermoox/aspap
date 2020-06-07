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

  def find
  	@approvedArticles = Article.all.where(approve: true)
  	@articles = @approvedArticles.ransack(title_cont: params[:q]).result(distinct: true)
  	@users = User.ransack(firstname_cont: params[:q]).result(distinct: true)

  	respond_to do |format|
  		format.html{}
  		format.json {
  			@articles = @articles.limit(5)
  			@users = @users.limit(5)
  		}
  	end
  end
end
