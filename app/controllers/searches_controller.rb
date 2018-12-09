class SearchesController < ApplicationController

	def new
		@search = Search.new
		@manuscripts = Manuscript.all.paginate(page: params[:page], per_page: 10)
		@users = User.all.paginate(page: params[:page], per_page: 10)
		@articles = Article.all.paginate(page: params[:page], per_page: 10)
		@posts = Post.all.paginate(page: params[:page], per_page: 10)
	end

	def create 
		@search = Search.create!(search_params)

		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
		@searches_manuscripts = @search.find_manuscripts.paginate(page: params[:page], per_page: 10)
		@searches_users = @search.find_users.paginate(page: params[:page], per_page: 10)
		@searches_articles = @search.find_articles.paginate(page: params[:page], per_page: 10)
		@searches_posts = @search.find_posts.paginate(page: params[:page], per_page: 10)
	end


	private

    def search_params
      params.require(:search).permit(:keywords, :category_id, :city_id, :min_price, :max_price)
    end
end
