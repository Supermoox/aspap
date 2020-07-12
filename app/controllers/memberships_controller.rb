class MembershipsController < InheritedResources::Base
  before_action :set_membership, only: [:show, :edit, :update, :destroy]
 	before_action :set_user, except: [:index, :edit, :show]
  before_action :authenticate_user!

  def new
    @membership = Membership.new
  end

  def index
    @memberships = Membership.all
    if !current_user.vip?
      redirect_to root_path
    end
  end
  
  def show
    unless current_user.vip?
      if current_user.membership.blank? || current_user.membership != @membership
        redirect_to root_path
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
    @membership.update(membership_params)
  end

 
  def destroy
    @membership.destroy
    redirect_to root_path
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

