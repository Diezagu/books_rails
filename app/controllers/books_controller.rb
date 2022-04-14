# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :setup_book, only: %i[edit update show destroy]
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(permitted_params)
    if @book.save
      flash[:notice] = 'book created!'
      redirect_to books_path
    else
      flash.now[:alert] = 'error while creating book'
      render 'new'
    end
  end

  def edit; end

  def update
    if @book.update(permitted_params)
      flash[:notice] = 'book updated!'
      redirect_to books_path
    else
      flash.now[:alert] = 'error while updating book'
      render 'edit'
    end
  end

  def show; end

  def destroy
    if @book.destroy
      flash[:notice] = 'book deleted!'
    else
      flash[:alert] = 'error while deleting a book'
    end
    redirect_to books_path
  end

  private

  def permitted_params
    params.require(:book).permit(:title, :author_id, :pages)
  end

  def setup_book
    @book = Book.find(params[:id])
  end
end
