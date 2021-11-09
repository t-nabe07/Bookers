class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:succes] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      #renderはviewしか起こさないので、renderの前に改めて定義が必要
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:succes] = "Book was successfully updated."
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
