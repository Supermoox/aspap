class MyApplicationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
 		@application = Download.where(user_id: current_user.id).last
 		if current_user.membership.blank?
	 		if @application.blank?
	 			redirect_to application_forms_path
	 			flash[:notice] = "You need to apply for membership first!"
	 		end
	 	elsif current_user.vip?
	 		flash[:notice] = "You are already an Executive Member!"
	 		redirect_to current_user.membership
	 	end
	 		
  end
end
