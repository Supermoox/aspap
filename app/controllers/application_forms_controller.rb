class ApplicationFormsController < ApplicationController
  before_action :authenticate_user!

	def index 
		@download = Download.new
		@form = Download.where(form: true).last
	end
end
