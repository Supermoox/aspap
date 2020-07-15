class MembershipsController < InheritedResources::Base
  before_action :set_membership, only: [:show, :edit, :update, :destroy]
 	before_action :set_user, except: [:index, :edit, :update, :destroy, :show]
  before_action :authenticate_user!

  def new
    @membership = Membership.new
  end

  def index
    @memberships = Membership.all.order("created_at")
    if !current_user.vip?
      redirect_to root_path
    end
  end
  
  def show
    unless current_user.vip?
      if current_user.membership.blank? || current_user.membership != @membership
        redirect_to root_path
      else
        @membership = Membership.find_by_uuid(params[:id])
      end
    end
  end

  def edit
  end


  def create
    @membership = Membership.new(membership_params)
    @membership.user_id = @user.id
    if @membership.save
      redirect_to @user
      flash[:notice] = "you have succsessifully added a membership"
    else
      render 'new'
    end 
  end


  def update
    if @membership.update(membership_params)
      redirect_to membership_path
      flash[:notice] = "Membership updated!"
    else
      render 'edit'
    end
  end

 
  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to memberships_url, notice: 'Membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
   	def set_membership
      @membership = Membership.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def membership_params
      params.require(:membership).permit(:mode, :active, :card, :kind)
    end
end

