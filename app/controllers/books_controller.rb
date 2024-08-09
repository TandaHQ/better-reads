class BooksController < ApplicationController
  before_action :set_book, only: [:show]

  # GET /books
  def index
    @books = Book.all
  end

  # GET /books/1
  def show
    @reviews = @book.reviews
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: "Book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :author, :description)
  end
end
