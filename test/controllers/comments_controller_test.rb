require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, post_id: posts(:one).id, comment: {commenter: 'Bob', body: 'Hi'}
    end
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy comment" do
    authenticate
    posts(:one).comments << comments(:one)

    assert_difference('Comment.count', -1) do
      delete :destroy, post_id: posts(:one).id, id: comments(:one).id
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should authenticate before destroy comment" do
    posts(:one).comments << comments(:one)
    delete :destroy, post_id: posts(:one).id, id: comments(:one).id
    assert_response 401
  end
end
