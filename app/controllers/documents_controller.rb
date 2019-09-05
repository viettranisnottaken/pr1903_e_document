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
