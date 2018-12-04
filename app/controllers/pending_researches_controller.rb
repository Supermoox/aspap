class PendingResearchesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user.vip?
      @reseaches = Research.all.where(approval: nil).paginate(page: params[:page], per_page: 10)
    else
      redirect_to root_path
    end
  end

end
