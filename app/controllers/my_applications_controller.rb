class MyApplicationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
 		@application = Download.where(user_id: current_user.id).last
 		if @application.blank?
 			redirect_to application_forms_path
 			flash[:notice] = "You need to apply for membership first!"
 		end
  end
end
