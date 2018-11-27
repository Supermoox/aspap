class DownloadsController < ApplicationController
  before_action :set_download, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]


  def index
    @downloads = Download.all
  end


  def new
    if current_user.vip?
      @download = Download.new
    else
      redirect_to root_path
    end
  end


  def create
    @download = Download.new(download_params)

    respond_to do |format|
      if @download.save
        format.html { redirect_to @download, notice: 'Download was successfully created.' }
        format.json { render :show, status: :created, location: @download }
      else
        format.html { render :new }
        format.json { render json: @download.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @download.destroy
    respond_to do |format|
      format.html { redirect_to downloads_url, notice: 'Download was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_download
      @download = Download.find(params[:id])
    end

    def download_params
      params.require(:download).permit(:title, :document)
    end
end
