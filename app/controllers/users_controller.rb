class UsersController < ApplicationController
  before_action :set_user, only: [:show, :verify_user, :delete_user]


  def index
    @users = User.all.order("created_at DESC")
  end

  def verify_user
   @user.update(verified: true)
   flash[:notice] = "User Verified!"
   redirect_to users_path
  end   
  def delete_user
   @user.destroy
   flash[:notice] = "User Deleted!"
   redirect_to users_path
  end 


  def show
    @user_researches = Research.where(user_id: @user.id).where(approval: true)
    @manuscripts = Manuscript.where(user_id: @user.id).where(approval: true)
    @articles = Article.where(user_id: @user.id).where(approve: true)
    @posts = Post.where(user_id: @user.id)
    @users = User.where("id = ?", @user.id)
    @post = Post.new
    @directorates = Directorate.all
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end  