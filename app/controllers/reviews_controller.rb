class ReviewsController < ApplicationController
  def index
    @reviews = Review.all.limit(20)
  end

  def new
    @books = Book.all.limit(20)
    @review = Review.new
  end

  def create
    review = Review.new(review_params)
    review.user = current_user

    if review.save
      redirect_to reviews_path
    else
      flash[:alert] = review.errors.full_messages.join(", ")
      redirect_to new_review_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:book_id, :rating, :content, :title)
  end
end
