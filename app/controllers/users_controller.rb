class UsersController < ApplicationController
  before_action :set_user, only: [:show]


  def index
    @users = User.all.order("created_at DESC")
  end
  def show
    @user_researches = Research.where(user_id: @user.id).where(approval: true)
    @manuscripts = Manuscript.where(user_id: @user.id).where(approval: true)
    @articles = Article.where(user_id: @user.id).where(approve: true)
    @posts = Post.where(user_id: @user.id)
    @users = User.where("id = ?", @user.id)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end  