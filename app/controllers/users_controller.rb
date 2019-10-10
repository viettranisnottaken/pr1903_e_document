class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :check_admin, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      log_in @user
      redirect_to @user
      flash[:success] = "Welcome to the gang"
    else
      render "new"
    end
  end

  def edit
    #code
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
      flash[:success] = "Profile updated"
    else
      redirect_to @user
      flash[:danger] = "Profile note updated"
    end
  end

  def show
    @user = User.find(params[:id])
    @histories = History.where({user_id: @user.id})
    @friend_request = current_user.active_relationships.find_by(following_id: current_user.id,
                                                                followed_id: @user.id)
    @downloaded_documents = current_user.downloaded_documents
  end

  def destroy
    #code for banning?
  end

  def friendlist
    @friends = current_user.following_friends + current_user.followed_friends
  end

  private

  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    unless @user == current_user
      respond_to do |format|
        format.html {redirect_to users_url, notice: "Mind your own business boi"}
      end
    end
  end

  def check_admin
    unless current_user.role == "admin"
      redirect_to root_path
      flash[:danger] = "Fuck off"
    end
  end
end
