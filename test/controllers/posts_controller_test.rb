require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = create :post
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create post" do
    authenticate
    attrs = attributes_for :post
    assert_difference('Post.count') do
      post :create, post: attrs
    end
    assert_redirected_to posts_path
  end

  test "should not create post without title" do
    authenticate
    assert_no_difference('Post.count') do
      post :create, post: {title: ''}
    end
    assert_response :success
  end

  test "should get show" do
    get :show, id: @post.id
    @post.reload
    assert_response :success
  end

  test "should get edit" do
    authenticate
    get :edit, id: @post.id
    assert_response :success
  end

  test "should update post" do
    authenticate
    put :update, id: @post.id, post: {title: 'Some title'}
    @post.reload
    assert_equal @post.state, "unpublished"

    assert_redirected_to :posts
  end

  test "should mark post as deleted" do
    authenticate

    assert_no_difference('Post.count', -1) do
      post :destroy, id: @post.id
    end

    @post.reload
    assert_equal @post.activity_state, "deleted"
    assert_redirected_to :posts
  end
end