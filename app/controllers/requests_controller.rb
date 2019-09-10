class RequestsController < ApplicationController
  def create
    current_user.requests.build
    unless (current_user.requested == "pending" || current_user.requested == "not_yet_rejected") && current_user.requests
      current_user.requests.create
      current_user.update_attribute(:requested, "pending")
      respond_to do |format|
        format.html {redirect_to root_path}
        format.json
      end
    else
      current_user.requests.delete
      redirect_to root_path
      flash[:success] = "You have already sent your request"
    end
  end
end
