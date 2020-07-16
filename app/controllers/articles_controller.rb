class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :vote, :destroy, :approve, :unrecommend]
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :js, :json, :html
  
  def index
    @articles = Article.all.where(approve: true).order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end


  def show
    

    if user_signed_in?
      unless current_user.vip? || @article.user == current_user || current_user.editor? || current_user.publisher?
        if !@article.approve
            redirect_to root_path
        end
      end
    else
      if !@article.approve
          redirect_to root_path
      end     
    end

    @url = "http://www.aspap.org/articles/" + @article.id.to_s
    @artireply = Artireply.new
    @reaction = Reaction.new
    @articomment = Articomment.new
    @articomments = Articomment.where(article_id: @article.id)
    @reactions = Reaction.where(article_id: @article.id)
    if user_signed_in?
      @user_reaction = @reactions.where(user_id: current_user.id).last
      @reactions.each do |reaction|
        if reaction.user == current_user
          @already_rcommended = true
        end
      end 
    end 
          
    if user_signed_in? && @article.user == current_user
      @article.update(counter: 0)
    end
  end

  def already_liked?
    Reaction.where(user_id: current_user.id, article_id: params[:article_id]).exists?
  end

  def new
    @article = current_user.articles.build
  end

  def edit
    unless current_user.vip?
      if @article.user != current_user
        redirect_to root_path
      end   
    end
  end


  def create
    @article = current_user.articles.build(article_params)
    respond_to do |format|
      if @article.save
        OrderMailer.with(article: @article).new_article_email.deliver_later
        format.html { redirect_to @article, notice: 'Article has been submited for approval.' }
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

  def vote
    if !current_user.liked? @article
      @article.liked_by current_user
    elsif current_user.liked? @article
      @article.unliked_by current_user
    end 
  end

  def unrecommend
    @reactions = Reaction.where(user_id: current_user.id).where(article_id: @article.id)

    if !@reactions.blank?
      @reaction = @article.reactions.where(user_id: current_user.id).last
      @reaction.destroy
    else
      @reaction = Reaction.new
    end
  end

 def approve
   @article.update(approve: true)
   redirect_to pending_articles_path
   flash[:notice] = "Article Approved!"
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
      params.require(:article).permit(:title, :image, :body, :approve, :user_id, :directorate_id, :counter)
    end
end
