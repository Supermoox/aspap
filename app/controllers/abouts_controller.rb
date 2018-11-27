class AboutsController < ApplicationController
  def index
    @aspap = Download.second  
  end
end
