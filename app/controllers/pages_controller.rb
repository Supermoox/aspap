class PagesController < ApplicationController
	def index 
		@posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 5)
		@events = Event.order("created_at DESC").first(4)
		@articles = Article.all.where(approve: true).order("created_at DESC").paginate(page: params[:page], per_page: 5)
		@journals = Journal.all
		@pictures = Journal.all
		@directorates = Directorate.all
		@post = Post.new

    @cosmology = @directorates.find(1)
    @nuclear = @directorates.find(2)
    @theoretical = @directorates.find(3)
    @quantum = @directorates.find(4)
    @solid = @directorates.find(6)
    @nanotech = @directorates.find(7)
    @electronics = @directorates.find(8)
    @IT = @directorates.find(9)
    @atmospheric = @directorates.find(10)
    @atomic = @directorates.find(11)
    @clean = @directorates.find(12)
    @AI = @directorates.find(17)
    @astronomy = @directorates.find(14)
    @medical = @directorates.find(15)
    @robotic = @directorates.find(16)
	end

  def find
  	@approvedArticles = Article.all.where(approve: true)
  	@articles = @approvedArticles.ransack(title_cont: params[:q]).result(distinct: true)
  	@users = User.ransack(firstname_cont: params[:q]).result(distinct: true)

  	respond_to do |format|
  		format.html{}
  		format.json {
  			@articles = @articles.limit(8)
  			@users = @users.limit(8)
  		}
  	end
  end
end
