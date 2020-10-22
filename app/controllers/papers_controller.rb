class PapersController < ApplicationController
  before_action :set_paper, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @papers = Paper.all
  end

  def edit
    if @paper.user_id != current_user.id
      redirect_to root_path
    end
  end


  def new
    @paper = Download.new
  end

  def show
  end

  def update
    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to current_user, notice: 'paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @paper }
      else
        format.html { render :edit }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @paper = Paper.new(paper_params)
    @paper.user_id = current_user.id
    if @paper.save
      redirect_to current_user
      flash[:notice] = 'Paper Added.' 
    else
      render 'new'
    end 
  end


  def destroy
    @paper.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Paper was Deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_paper
      @paper = Paper.find(params[:id])
    end

    def paper_params
      params.require(:paper).permit(:title, :document, :description)
    end
end
