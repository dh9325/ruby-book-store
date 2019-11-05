class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @page_title = 'New Book'
    @book = Book.new
  end

  def edit
    @page_title = 'Edit Book'
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  end

  private

    def book_params
      params.require(:book).permit(:title, :category_id, :author_id, :publisher_id, :isbn, :year, :price, :buy, :exceprt, :format, :pages)
    end
end
