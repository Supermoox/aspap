class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :approve]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all.where(approve: true).paginate(page: params[:page], per_page: 10)
  end


  def show
    
    unless @article.approve?
      unless current_user.vip?
        redirect_to root_path 
      end
    end 
    @artireply = Artireply.new
    @articomment = Articomment.new
    @articomments = Articomment.where(article_id: @article.id)

    if user_signed_in? && @article.user == current_user
      @article.update(counter: 0)
    end
  end


  def new
    @article = current_user.articles.build
  end

  def edit
    if @article.user != current_user 
      redirect_to root_path
    end
  end


  def create
    @article = current_user.articles.build(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

 def approve
   @article.update(approve: true)
   redirect_to pending_articles_path
 end
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :image, :body, :approve, :user_id, :counter)
    end
end
