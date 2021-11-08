class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    #データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    #データをデータベースに保存するためのsaveメソッド実行
    book.save
    #詳細画面showへリダイレクト（名前付きルート設定）
    redirect_to book_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
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
