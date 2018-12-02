class ArtirepliesController < InheritedResources::Base
  before_action :set_artireply, only: [:show, :edit, :update, :destroy]
  before_action :set_articomment
  before_action :authenticate_user!, except: [:index, :show]



  def show
  end

  def new
    @artireply = Artireply.new
  end

  def edit
  end

  def create
    @artireply = Artireply.new(artireply_params)
    @artireply.user_id = current_user.id
    @artireply.articomment_id = @articomment.id


    if @artireply.save
      redirect_to @articomment
    else
      render 'new'
    end
  end



  private
    def set_artireply
      @artireply = Artireply.find(params[:id])
    end

    def set_articomment
      @articomment = Articomment.find(params[:articomment_id])
    end

    def artireply_params
      params.require(:artireply).permit(:body, :articomment_id)
    end
end

