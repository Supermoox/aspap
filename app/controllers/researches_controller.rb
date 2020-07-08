class ResearchesController < ApplicationController
  before_action :set_research, only: [:show, :edit, :update, :destroy, :approve]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @researches = Research.where(approval: true)
    @allresearches = Research.all
  end

 
  def show
    if user_signed_in?
      unless current_user.vip? || @research.user == current_user || current_user.editor? || current_user.publisher?
        if !@research.approval
            redirect_to root_path
        end
      end
    else
      if !@research.approval
          redirect_to root_path
      end     
    end
    @user_researches = Research.where(user_id: @research.user.id).where("id != ?", @research.id ).where(approval: true)
    @manuscripts = Manuscript.where(user_id: @research.user.id).where(approval: true)

  end
 
  def new
    @research = current_user.researches.build
  end

  def edit
    if  @research.user != current_user
      flash[:success] = "You are prohibited from edition this Item!"
      redirect_to root_path
    end
  end
 
  def create
    @research = Research.new(research_params)
    @research = current_user.researches.build(research_params)
    respond_to do |format|
      if @research.save
        format.html { redirect_to @research, notice: 'Your Research has been submitted for approval!' }
        format.json { render :show, status: :created, location: @research }
      else
        format.html { render :new }
        format.json { render json: @research.errors, status: :unprocessable_entity }
      end
    end
  end

 
 
  def update
    respond_to do |format|
      if @research.update(research_params)
        format.html { redirect_to @research, notice: 'Research was successfully updated.' }
        format.json { render :show, status: :ok, location: @research }
      else
        format.html { render :edit }
        format.json { render json: @research.errors, status: :unprocessable_entity }
      end
    end
  end

  def approve
    @research.update(approval: true)
    @research.update(created_at: DateTime.now)
    flash[:success] = "Item Approved!"
    redirect_to research_path
  end
 
  def destroy
    @research.destroy
    respond_to do |format|
      format.html { redirect_to researches_url, notice: 'Research was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_research
      @research = Research.find(params[:id])
    end

    def research_params
      params.require(:research).permit(:topic, :Research_area, :description, :concluded,  :approval, :directorate_id)
    end
end
