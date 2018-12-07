class JournalsController < ApplicationController
  before_action :set_journal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index ]
 
  def new
    unless current_user.vip?
      redirect_to root_path
    end
    @journal = Journal.new
  end
  def show
    @manuscripts = Manuscript.where(journal_id: @journal.id).where(approval: true).paginate(page: params[:page], per_page: 10)
  end

  def index
    @journals = Journal.all.paginate(page: params[:page], per_page: 10)
  end

  def edit
    unless current_user.vip?
      redirect_to root_path
    end
  end

  def create
    @journal = Journal.new(journal_params)

    respond_to do |format|
      if @journal.save
        format.html { redirect_to @journal, notice: 'Journal was successfully created.' }
        format.json { render :show, status: :created, location: @journal }
      else
        format.html { render :new }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @journal.update(journal_params)
        format.html { redirect_to @journal, notice: 'Manuscript was successfully updated.' }
        format.json { render :show, status: :ok, location: @journal }
      else
        format.html { render :edit }
        format.json { render json: @manuscjournalript.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_journal
      @journal = Journal.find(params[:id])
    end

    def journal_params
      params.require(:journal).permit(:name, :description)
    end
end
