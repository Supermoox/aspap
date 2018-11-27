class ConstitutionsController < ApplicationController
	def index
    @constitution = Download.first  
  end
end
