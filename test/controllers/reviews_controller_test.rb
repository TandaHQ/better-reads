require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest

  setup do
    user = users(:austin)
    post session_path, params: { email: user.email, password: "betterreads" }
  end

  test "should get index" do
    get reviews_path
    assert_response :success
  end

  test "should create a review" do
    book = books(:one)
    assert_difference("Review.count", 1) do
      post reviews_path, params: { review: { book_id: book.id, rating: 5, content: "Great book!", title: "Great book!" } }
    end
  end
end
