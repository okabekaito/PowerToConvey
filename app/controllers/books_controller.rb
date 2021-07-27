class BooksController < ApplicationController
  def index
  @books =Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  @book = Book.new
  end

  def create
  @book = Book.new(book_params)


  if @book.save
  redirect_to @book, notice:"「#{book.title}」を登録しました"
  else
    render :new
  end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update!(book_params)
    redirect_to books_url, notice:"「#{book.title}」を更新しました"
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_url, notice:"「#{book.title}」を削除しました"
  end

  private

  def book_params
    params.require(:book).permit(:title,:author,:wrapUp)
  end
end
