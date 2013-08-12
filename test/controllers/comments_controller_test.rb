require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @post = create :post
    @comment = create :comment
  end

  test "should create comment" do
    sign_in @comment.user
    attrs = attributes_for :comment
    post :create, post_id: @post.id, user_id: @comment.user_id, comment: attrs

    assert_response :redirect
    comment = Comment.find_by_body(attrs[:body])
    assert comment
  end

  test "should destroy comment" do
    sign_in @comment.user
    @post.comments << @comment
    delete :destroy, post_id: @post.id, id: @comment.id

    assert_response :redirect
    assert !Comment.exists?(@comment)
  end
end