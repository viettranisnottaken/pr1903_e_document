class DocumentsController < ApplicationController
  before_action :set_document, only: [:edit, :update, :show, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @documents = current_user.documents.all
  end

  def new
    @document = current_user.documents.build
  end

  def create
    @document = current_user.documents.build(document_params)
    if @document.save!
      @document.file_name.attach(params[:document][:file_name])
      redirect_to @document
      flash[:success] = "File uploaded!"
    else
      render :new
    end
  end

  def show
    @document = Document.find(params[:id])
    @history = History.find_by(user_id: current_user.id, document_id: @document.id)
    if @history
      @history.update_attribute(:counter, @history.counter + 1)
    else
      @history = History.create(document_id: @document.id, user_id: current_user.id, counter: 1)
    end

    @total_view = History.where(document_id: @document.id).sum(:counter)
    @document.update_attribute(:view_count, @total_view)
  end

  def edit
    #code
  end

  def update
    if @document.update_attributes(document_params)
      redirect_to @document
      flash[:success] = "Document updated"
    else
      redirect_to @document
      flash[:danger] = "Document not updated"
    end
  end

  def destroy
    #code
  end

  private

  def document_params
    params.require(:document).permit(:file_name, :description, :author, category_ids: [])
  end

  def set_document
    @document = Document.find(params[:id])
  end

  def correct_user
    unless @document.user == current_user
      respond_to do |format|
        format.html {redirect_to root_path, notice: "Mind your own business boi"}
      end
    end
  end
end
