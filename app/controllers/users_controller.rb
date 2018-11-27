class UsersController < ApplicationController
  before_action :set_user, only: [:show]


  def index
    @users = User.all
  end
  def show
    @user_researches = Research.where(user_id: @user.id).where(approval: true)
    @manuscripts = Manuscript.where(user_id: @user.id).where(approval: true)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end  