class DownloadsController < ApplicationController
  before_action :set_download, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]


  def index
    @downloads = Download.where(form: true)
  end


  def new
    if current_user.vip?
      @download = Download.new
    else
      redirect_to root_path
    end
  end

  def show
    unless current_user.vip? || current_user.editor? || current_user.publisher?
      redirect_to root_path
    end
  end


  def create
    @download = Download.new(download_params)
    @download.user_id = current_user.id
    if @download.save
      redirect_to root_path
      flash[:notice] = 'Document Submitted.' 
    else
      render 'new'
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
      params.require(:download).permit(:title, :document, :form, :application)
    end
end
