# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    #code
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(users_params)
    if user.save
      user.avatar.attach(params[:user][:avatar])
      log_in user
      redirect_to user
      flash[:success] = "Welcome to the gang"
    else
      render "new"
    end
  end

  def edit
    #code
  end

  def update
    #code
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    #code
  end

  private

  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
