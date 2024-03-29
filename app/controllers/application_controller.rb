class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_journals
  before_action :set_directorates
  before_action :notifcation
  before_action :configure_permitted_parameters, if: :devise_controller? 
	helper_method :mailbox, :conversation
	before_action :set_search
	before_action :set_manuscripts
	before_action :set_research
	before_action :set_articles
	before_action :set_editors
	before_action :set_applications


	private 

	def mailbox
		@mailbox ||= current_user.mailbox
	end

	def conversation
   	@conversation ||= mailbox.conversations.find(params[:id])
  end

  def notifcation
		if user_signed_in? 
			@active_posts = Post.where(user_id: current_user.id).where("counter > ?", 0)
			@active_articles = Article.where(user_id: current_user.id).where("counter > ?", 0)
			@notifications = 0
			unless @active_posts.blank?
				@active_posts.each do |post|
					@notifications += post.counter
				end
			end			
			unless @active_articles.blank?
				@active_articles.each do |article|
					@notifications += article.counter
				end
			end
		end
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
	def set_manuscripts
		@pending_manuscripts = Manuscript.where(approval: nil).count
	end	
	def set_research
		@pending_research = Research.where(approval: nil).count
	end	
	def set_articles
		@pending_articles = Article.where(approve: nil).count
	end	
	def set_editors
		@pending_requests = Editor.all.count
	end	
	def set_applications
		@received_applications = Download.where(application: true).where(form: false).count
	end
		
	protected

	def configure_permitted_parameters 
		@search = Search.new
		devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:institution, :document, :field, :qualification, :description, :year_completed, :title, :firstname, :PR, :middlename, :surname, :phone, :placeOfWork, :image, :email, :password, :password_confirmation, :remember_me) } 
		devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) } 
		devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:document, :institution, :field, :qualification, :year_completed, :title, :description, :firstname, :PR, :middlename, :surname, :phone, :placeOfWork, :image, :vip, :verified, :editor, :email, :password, :password_confirmation, :current_password) } 
	end 
end
