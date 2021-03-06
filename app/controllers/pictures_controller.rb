class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]


  def index
    @pictures = Picture.all
  end

  def show
  end

  def new
    if current_user.vip?
      @picture = Picture.new
    else
      redirect_to root_path
    end
  end



  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      redirect_to pictures_path
    else
      render 'new'
    end
  end


  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:image)
    end
end
