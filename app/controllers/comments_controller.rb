# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :check_if_logged_in
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :current_user?, only: [:edit, :destroy]

  def create
    document = Document.find(params[:document_id])
    comment = document.comments.build(comment_params)
    if comment.save
      redirect_to document
      flash[:success] = "Comment added"
    else
      redirect_to document
      flash[:danger] = "Comment not added"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to document_path(@comment.document.id)
      flash[:success] = "Comment edited"
    else
      redirect_to document_path(@comment.document.id)
      flash[:danger] = "Comment not edited"
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to document_path(@comment.document.id)
  end

  def index
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user).with_defaults(user: current_user)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def current_user?
    unless @comment.user == current_user
      redirect_to @comment.document
      flash[:danger] = "Please don't meddle with others' stuffs"
    end
  end

end
