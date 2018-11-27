class MyArticlesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user.vip? || current_user.publisher? || current_user.editor? || current_user.PR?
      @desired_id = current_user.id
   		@articles = Article.where(user_id: @desired_id).order("created_at DESC").paginate(page: params[:page], per_page: 10)
    else
      redirect_to root_path
    end
  end
end
