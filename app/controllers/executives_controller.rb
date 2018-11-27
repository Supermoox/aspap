class ExecutivesController < ApplicationController
  before_action :set_executive, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]


  def index
    @executives = Executive.all.order("created_at")
  end

  def show
  end


  def new
    if current_user.vip?
      @executive = Executive.new
    else
      redirect_to root_path
    end
  end

  def edit
    if !current_user.vip?
      redirect_to root_path
    end
  end

  def create
    @executive = Executive.new(executive_params)


    if @executive.save
      redirect_to root_path
      flash[:notice] = "Executive member added!"
    else
      render 'new'
    end
  end


  def update
    if @executive.update(executive_params)
      redirect_to root_path
      flash[:notice] = "Executive updated!"
    else
      render 'edit'
    end
  end


  def destroy
    @executive.destroy
    respond_to do |format|
      format.html { redirect_to executives_url, notice: 'Journal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_executive
      @executive = Executive.find(params[:id])
    end

    def executive_params
      params.require(:executive).permit(:name, :position, :image, :research_interest, :education, :expertise, :description)
    end
end
