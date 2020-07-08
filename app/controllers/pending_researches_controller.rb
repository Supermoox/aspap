class PendingResearchesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user.vip? || current_user.editor? || current_user.publisher?
      @reseaches = Research.all.where(approval: nil).paginate(page: params[:page], per_page: 10)
    else
      redirect_to root_path
    end
  end

end
