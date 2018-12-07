class ArticommentsController < InheritedResources::Base
  before_action :set_articomment, only: [:show, :edit, :update, :destroy]
  before_action :set_article
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @articomment = Articomment.new
  end
  def edit
    if @articomment.user != current_user
      redirect_to root_path
    end
  end

  def create
    @articomment = Articomment.new(articomment_params)
    @articomment.user_id = current_user.id
    @articomment.article_id = @article.id

    unless @article.user == current_user
      if @article.counter == nil
        @article.update(counter: 1)
      else
        @article.update(counter: @article.counter + 1)
      end
    end

    if @articomment.save
      redirect_to @article
    else
      render 'new'
    end
  end
  private
    def set_articomment
      @articomment= Articomment.find(params[:id])
    end

    def set_article
      @article = Article.find(params[:article_id])
    end

    def articomment_params
      params.require(:articomment).permit(:body, :article_id)
    end
end

