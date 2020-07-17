class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
    @post = Post.new
  end


  def show
    @comment = Comment.new
    @reply = Reply.new
    @comments = Comment.where(post_id: @post.id)
    if user_signed_in? && @post.user == current_user
      @post.update(counter: 0)
    end
  end

  def new
    @post = current_user.posts.build
  end

  def edit
    if @post.user != current_user
      flash[:success] = "You are prohibited from editing this Item!"
      redirect_to root_path
    end
  end


  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :counter, :directorate_id, :image)
    end
end
