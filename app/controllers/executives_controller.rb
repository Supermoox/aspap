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

    respond_to do |format|
      if @executive.save
        format.html { redirect_to @executive, notice: 'executive was successfully created.' }
        format.json { render :show, status: :created, location: @executive }
      else
        format.html { render :new }
        format.json { render json: @executive.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @executive.update(executive_params)
        format.html { redirect_to @executive, notice: 'executive was successfully updated.' }
        format.json { render :show, status: :ok, location: @executive }
      else
        format.html { render :edit }
        format.json { render json: @executive.errors, status: :unprocessable_entity }
      end
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
