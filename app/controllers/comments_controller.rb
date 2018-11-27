class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_post
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @comments = Comment.all
  end


  def show
  end


  def new
    @comment = Comment.new
  end

  def edit
    if @comment.user != current_user
      flash[:success] = "You are prohibited from edition this Item!"
      redirect_to root_path
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id


    if @comment.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end
