class ApplicationFormsController < ApplicationController
  before_action :authenticate_user!



	def index 
		if current_user.downloads.blank?
			@download = Download.new
			@form = Download.where(form: true).last
		else
			redirect_to root_path
			flash[:notice] = "You already applied for membership!"
		end
	end
end
