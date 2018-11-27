class SearchesController < ApplicationController

	def new
		@search = Search.new
		@manuscripts = Manuscript.all.paginate(page: params[:page], per_page: 10)
	end

	def create 
		@search = Search.create!(search_params)

		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
		@searches = @search.find_manuscripts.paginate(page: params[:page], per_page: 10)
	end


	private

    def search_params
      params.require(:search).permit(:keywords, :category_id, :city_id, :min_price, :max_price)
    end
end
