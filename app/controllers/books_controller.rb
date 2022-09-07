class BooksController < ApplicationController
  def new
    @books = Book.all
    @new = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to "/books"
  end

  def show
    @id = params[:id]
    @books = Book.find_by(id: params[:id])
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end