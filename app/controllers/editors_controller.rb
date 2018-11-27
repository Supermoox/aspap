class EditorsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_editor, only: [:show, :edit, :update, :destroy]

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
    

  def create
    @editor = Editor.new(editor_params)
    @editor.user_id = current_user.id
    if @editor.save
      redirect_to root_path
      flash[:notice] = "Request Sent"
    else
      render 'new'
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

