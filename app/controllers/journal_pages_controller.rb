class JournalPagesController < ApplicationController
	def index 
		@journals = Journal.all
	end
end
