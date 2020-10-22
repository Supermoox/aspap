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
    @membership = Membership.new
    @paper = Paper.new
    @papers = Paper.where(user_id: @user.id)
    
    if @user.membership.blank? 
      @membership_exists = false
    else
      @membership_exists = true
    end
  end
  def create
    @user = User.new(params[:user])
 
    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.with(user: @user).welcome_email.deliver_later
 
        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end  