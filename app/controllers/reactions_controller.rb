class ReactionsController < InheritedResources::Base
 	before_action :set_article
	before_action :authenticate_user!
  
  def new
    @reaction = Reaction.new
  end

  def create
    @reaction = Reaction.new(:recomend => true)
    @reaction.user_id = current_user.id
    @reaction.article_id = @article.id

    if @reaction.save
      redirect_to @article
      flash[:notice] ="You have Recommend this article!"
    else
      render 'new'
    end
  end

  private
    def set_reaction
      @reaction = Reaction.find(params[:id])
    end

    def reaction_params
      params.require(:reaction).permit(:recomend)
    end

   	def set_article
  	  @article = Article.find(params[:article_id])
  	end
end

