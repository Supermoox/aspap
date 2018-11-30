class DirectoratesController < ApplicationController
  before_action :set_directorate, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def show
    @researches = Research.where(directorate_id: @directorate).paginate(page: params[:page], per_page: 10)
  end


  def new
    if current_user.vip?
      @directorate = Directorate.new
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
    @directorate = Directorate.new(directorate_params)

    respond_to do |format|
      if @directorate.save
        format.html { redirect_to @directorate, notice: 'Drectorate was successfully created.' }
        format.json { render :show, status: :created, location: @directorate }
      else
        format.html { render :new }
        format.json { render json: @directorate.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @directorate.update(directorate_params)
      redirect_to root_path
      flash[:notice] = "Drectorate updated!"
    else
      render 'edit'
    end
  end
  def destroy
    @directorate.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Directorate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    def set_directorate
      @directorate = Directorate.find(params[:id])
    end

    def directorate_params
      params.require(:directorate).permit(:name, :description)
    end
end
