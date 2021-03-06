class EditorsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_editor, only: [:show, :edit, :update, :destroy, :approve_editor, :approve_peer, :verify_user, :approve_publisher]

  def new
    @editors = Editor.all
    @editors.each do |editor|
      if editor.user == current_user
        @already_requested = true
      end
    end
    if @already_requested
      flash[:notice] = "You have already Submited a request!"
      redirect_to root_path
    else
      @editor = Editor.new
    end
  end

  def index
    if current_user.vip?
      @editors = Editor.all
    else
      redirect_to root_path
    end
  end

  def show
    if !current_user.vip?
      redirect_to root_path
    end 
  end
   
  def approve_editor
   @editor.user.update(editor: true)
   @editor.destroy
   flash[:notice] = "Request approved!"
   redirect_to editors_path
  end 
  def approve_peer
   @editor.user.update(PR: true)
   @editor.destroy
   flash[:notice] = "Request approved!"
   redirect_to editors_path
  end 
  def approve_publisher
   @editor.user.update(publisher: true)
   @editor.destroy
   flash[:notice] = "Request approved!"
   redirect_to editors_path
  end   
  def verify_user
   @editor.user.update(verified: true)
   @editor.destroy
   flash[:notice] = "User Verified!"
   redirect_to editors_path
  end 

  def create
    @editor = Editor.new(editor_params)
    @editor.user_id = current_user.id
    if @editor.user.editor && @editor.request == "editor"
      redirect_to root_path
      flash[:notice] = "You are already an editor"   
    elsif @editor.user.PR && @editor.request == "peer_reviewer"
      redirect_to root_path
      flash[:notice] = "You are already a Peer Reviwer!"      
    elsif @editor.user.publisher && @editor.request == "publisher"
      redirect_to root_path
      flash[:notice] = "You are already a publisher!"  
    else
      if @editor.save
        redirect_to root_path
        flash[:notice] = "Request Sent"
      else
        render 'new'
      end 
    end 
  end


  private
    def set_editor
      @editor = Editor.find(params[:id])
    end
    def editor_params
      params.require(:editor).permit(:request)
    end
end

