class BooksController < ApplicationController
  def new
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to "/books/#{@book.id}"
    else
      render :new
    end
  end

  def show
    @id = params[:id]
    @books = Book.find_by(id: params[:id])
  end

  def edit
    @book = Book.find_by(id: params[:id])
  end

  def destroy
    book_delete = Book.find_by(id: params[:id])
    book_delete.destroy
    redirect_to "/books/new"
    flash[:notice] = "Book was successfully destroyed."
  end

  def update
    @book = Book.find_by(id: params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      flash[:alarm] = "Book was successfully updated."
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
