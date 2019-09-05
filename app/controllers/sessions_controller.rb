# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
      flash[:success] = "Enjoy your stay"
    else
      redirect_to action: :new
      flash[:danger] = "Something went wrong"
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
