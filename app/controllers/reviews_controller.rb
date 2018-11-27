class ReviewsController < InheritedResources::Base
  before_action :set_review, only: [:show, :edit, :update, :destroy]
 	before_action :set_manuscript
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  
  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.manuscript_id = @manuscript.id
    if @review.save
      redirect_to @manuscript
      flash[:notice] = "you have succsessifully added a Review"
    else
      render 'new'
    end 
  end

  def update
    @review.update(review_params)
  end

 
  def destroy
    @review.destroy
    redirect_to root_path
  end

  private

   	def set_review
      @review = Review.find(params[:id])
    end
    
    def set_manuscript
      @manuscript = Manuscript.find(params[:manuscript_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end

end

