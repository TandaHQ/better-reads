class ReviewsController < ApplicationController
  def index
    @reviews = Review.all.limit(20)
  end

  def new
    @books = Book.all.limit(20)
    @review = Review.new
  end

  def create
    @review = Review.new(book_id: params[:review][:book_id].to_i, rating: params[:review][:rating].to_i, content: params[:review][:content], title: params[:review][:title])
    @review.user = current_user

    if @review.save
      redirect_to reviews_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
