class FavoritesController < ApplicationController
  def create
    document = Document.find_by(id: params[:favorites][:document_id])
    favorite = Favorite.new(favorite_params)
    if favorite.save
      redirect_to document_path(document)
      flash[:success] = "Document added to favorite"
    else
      redirect_to document_path
      flash[:danger] = "Doc not added to favorite"
    end
  end

  def destroy
    # code
  end

  private
  def favorite_params
    params.require(:favorites).permit(:document_id, :user_id)
  end
end
