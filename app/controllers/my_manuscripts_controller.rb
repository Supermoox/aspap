class MyManuscriptsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @desired_id = current_user.id
    @manuscripts = Manuscript.where(user_id: @desired_id).order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

end
