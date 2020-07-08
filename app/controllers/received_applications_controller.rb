class ReceivedApplicationsController < ApplicationController
  before_action :authenticate_user!

	def index 
    if current_user.vip?
      @applications = Download.where(application: true).where(form: false)
    else
      redirect_to root_path
    end
	end
  def show
    unless current_user.vip? || current_user.editor? || current_user.publisher?
      redirect_to root_path
    end 
  end
end
