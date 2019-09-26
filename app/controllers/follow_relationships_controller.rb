class FollowRelationshipsController < ApplicationController
  def index
    @friend_requests = current_user.passive_relationships.not_yet_accepted
  end

  def create
    @user = User.find(params[:followed_id])
    current_user.active_relationships.create!(followed_id: @user.id, status: "pending")
    respond_to do |format|
      format.html {redirect_to @user}
      format.json
    end
  end

  def update
    relationship = FollowRelationship.find(params[:id])
    relationship.update_attribute(:status, "accepted")
    redirect_to action: :index
    flash[:success] = "Friend added"
  end

  def destroy
    relationship = FollowRelationship.find(params[:id])
    user = relationship.followed
    relationship.destroy
    respond_to do |format|
      format.html {redirect_to user}
      format.js
    end
  end
end
