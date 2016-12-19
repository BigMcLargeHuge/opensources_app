require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  test "should get review" do
    get :review
    assert_response :success
  end

end
