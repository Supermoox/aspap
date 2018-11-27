class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_journals
  before_action :set_directorates
  before_action :configure_permitted_parameters, if: :devise_controller? 
	helper_method :mailbox, :conversation
	before_action :set_search


	private 

	def mailbox
		@mailbox ||= current_user.mailbox
	end

	def conversation
   	@conversation ||= mailbox.conversations.find(params[:id])
  end

 	def set_journals
		@journals = Journal.all
	end  	
	def set_directorates
		@directorates = Directorate.all
	end 	
	def set_search
		@search = Search.new
	end
		
	protected

	def configure_permitted_parameters 
		@search = Search.new
		devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :institution, :document, :field, :qualification, :year_completed, :title, :firstname, :PR, :middlename, :surname, :phone, :placeOfWork, :image, :email, :password, :password_confirmation, :remember_me) } 
		devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) } 
		devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :document, :institution, :field, :qualification, :year_completed, :title, :firstname, :PR, :middlename, :surname, :phone, :placeOfWork, :image, :vip, :editor, :email, :password, :password_confirmation, :current_password) } 
	end 
end
