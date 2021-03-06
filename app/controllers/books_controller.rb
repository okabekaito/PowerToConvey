class BooksController < ApplicationController
  before_action :set_book, only:[:show, :edit, :update, :destroy]
  
  def index
  @q = current_user.books.ransack(params[:q])
  @books = @q.result(distinct: true).page(params[:page])
  end

  def show
  end

  def new
  @book = Book.new
  end

  def create
  @book = current_user.books.new(book_params)


  if @book.save
  redirect_to @book, notice:"「#{@book.title}」を登録しました"
  else
    render :new
  end
  end

  def edit
  end

  def update
    @book.update!(book_params)
    redirect_to books_url, notice:"「#{@book.title}」を更新しました"
  end

  def destroy
    @book.destroy
  end

  private

  def book_params
    params.require(:book).permit(:title,:author,:wrapUp,:image)
  end

  def set_book
    @book = current_user.books.find(params[:id])
  end
end
