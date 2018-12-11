class ManuscriptsController < ApplicationController
  before_action :set_manuscript, only: [:show, :edit, :update, :destroy, :approve]
  before_action :authenticate_user!

  
  def index
    if current_user.vip? || current_user.PR? || current_user.editor? || current_user.publisher?
      @manuscripts = Manuscript.where(approval: nil).order("created_at DESC")
    else
      redirect_to root_path
    end
  end

 
  def show 
    if current_user.vip? || current_user.PR? || current_user.editor? || current_user.publisher?
      @review = Review.new
      @reviews = Review.where(manuscript_id: @manuscript.id).order("created_at DESC")
      @user_reviews = @reviews.where(user_id: current_user.id).order("created_at DESC")

      if @reviews.blank?
        @avg_review = 0
      else
        @avg_review = @reviews.average(:rating).round(2)
        @reviews.each do |review|
          if review.user == current_user
            @already_reviewd = true
          end
        end       
      end
    else
      redirect_to root_path
    end
  end

  def new
   @manuscripts = Manuscript.where(approval: true).order("created_at")
   if current_user.publisher?
    @manuscript = Manuscript.new
   else
    @manuscript = current_user.manuscripts.build
  end
  end

  def edit
    @manuscripts = Manuscript.where(approval: true).order("created_at")
    if  @manuscript.user != current_user
      redirect_to root_path
    end
  end

  def create
    if current_user.publisher?
      @manuscript = Manuscript.new(manuscript_params)
      @manuscript.approval = true
    else
      @manuscript = current_user.manuscripts.build(manuscript_params)
    end
    respond_to do |format|
      if @manuscript.save
        format.html { redirect_to @manuscript, notice: 'Manuscript was successfully created.' }
        format.json { render :show, status: :created, location: @manuscript }
      else
        format.html { render :new }
        format.json { render json: @manuscript.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @manuscript.update(manuscript_params)
        format.html { redirect_to @manuscript, notice: 'Manuscript was successfully updated.' }
        format.json { render :show, status: :ok, location: @manuscript }
      else
        format.html { render :edit }
        format.json { render json: @manuscript.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @manuscript.destroy
    respond_to do |format|
      format.html { redirect_to manuscripts_url, notice: 'Manuscript was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    @manuscript.update(approval: true)
    @manuscript.update(created_at: DateTime.now)
    flash[:success] = "Your Item has been successfully Activated!"
    redirect_to editors_path
  end

  private

    def set_manuscript
      @manuscript = Manuscript.find(params[:id])
    end

    def manuscript_params
      params.require(:manuscript).permit(:title, :journal_id, :user_id, :abstract, :approval, :document, :image, :volume, :issue)
    end
end
