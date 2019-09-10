class Admin::RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def update
    request = Request.find(params[:id])
    user = request.user
    request.user.update_attribute(:requested, params[:requested])
    if request.user.requested == "accepted"
      request.user.update_attribute(:role, "admin")
      request.delete
      redirect_to action: :index
    elsif request.user.requested == "not_yet_rejected"
      redirect_to reason_admin_user_path
    end
  end
end
