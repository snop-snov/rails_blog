require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @post = create :post
    @user = create :user
    @comment = create :comment
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, post_id: @post.id, comment: {commenter: 'Bob', body: 'Hi'}
    end
    assert_redirected_to post_path(@post)
  end

  test "should destroy comment" do
    authenticate
    @post.comments << @comment

    assert_difference('Comment.count', -1) do
      delete :destroy, post_id: @post.id, id: @comment.id
    end

    assert_redirected_to post_path(@post)
  end

  test "should authenticate before destroy comment" do
    @post.comments << @comment
    delete :destroy, post_id: @post.id, user_id: @user.id, id: @comment.id
    assert_response 401
  end

end