# frozen_string_literal: true

class CommentsController < ApplicationController
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

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(permitted_params)
      flash[:notice] = 'comment updated!'
      redirect_to comments_path
    else
      flash[:alert] = 'error while updating comment'
      render :edit
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
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
end
