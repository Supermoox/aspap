class MyResearchesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @desired_id = current_user.id
    @researches = Research.where(user_id: @desired_id).order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'The item has successfully been removed.' }
      format.json { head :no_content }
    end
  end
end
