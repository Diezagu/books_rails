# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :setup_comment, only: %i[edit update show destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(permitted_params)
    if @comment.save
      flash[:notice] = 'comment posted!'
      redirect_to comments_path
    else
      flash[:alert] = "can't post the comment"
      render :new
    end
  end

  def edit; end

  def update
    if @comment.update(permitted_params)
      flash[:notice] = 'comment updated!'
      redirect_to comments_path
    else
      flash[:alert] = 'error while updating comment'
      render :edit
    end
  end

  def show; end

  def destroy
    if @comment.destroy
      flash[:notice] = 'comment deleted!'
    else
      flash[:alert] = 'error while deleting a comment'
    end
    redirect_to comments_path
  end

  private

  def permitted_params
    params.require(:comment).permit(:author_id, :text)
  end

  def setup_comment
    @comment = Comment.find(params[:id])
  end
end
