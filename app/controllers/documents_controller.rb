class DocumentsController < ApplicationController
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
  end

  def edit
    #code
  end

  def update
    #code
  end

  def destroy
    #code
  end

  private

  def document_params
    params.require(:document).permit(:file_name, :description, :author)
  end
end
