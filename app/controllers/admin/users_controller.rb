class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:destroy]

  def update_role
  request = Request.find(params[:id])
  @user = request.user
    if @user.update_attribute(:reason, params[:user][:reason])
      @user.update_attribute(:requested, "rejected")
      redirect_to @user
      request.delete
      flash[:success] = "done"
    else
      redirect_to requests_path
      flash[:danger] = "not done"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def check_admin
    unless current_user.role == "admin"
      redirect_to root_path
      flash[:danger] = "Fuck off"
    end
  end
end
