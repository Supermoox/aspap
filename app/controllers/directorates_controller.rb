class DirectoratesController < ApplicationController
  before_action :set_directorate, only: [:show, :edit, :update, :destroy]

  def show
    @researches = Research.where(directorate_id: @directorate)
  end


  def new
    @directorate = Directorate.new
  end

  private
    def set_directorate
      @directorate = Directorate.find(params[:id])
    end

    def directorate_params
      params.require(:directorate).permit(:name, :description)
    end
end
