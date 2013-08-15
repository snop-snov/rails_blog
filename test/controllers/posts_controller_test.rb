require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = create :post
    @owner = create :owner
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create post" do
    sign_in @owner
    attrs = attributes_for :post
    post :create, post: attrs

    assert_response :redirect
    post = Post.find_by_title(attrs[:title])
    assert post
  end

  test "should get show" do
    get :show, id: @post.id
    @post.reload
    assert_response :success
  end

  test "should get edit" do
    sign_in @owner
    get :edit, id: @post.id
    assert_response :success
  end

  test "should update post" do
    sign_in @owner
    put :update, id: @post.id, post: {title: 'Some title'}
    @post.reload
    assert_equal @post.state, "unpublished"

    assert_redirected_to :posts
  end

  test "should mark post as deleted" do
    sign_in @owner
    post :destroy, id: @post.id
    assert_response :redirect

    @post.reload
    assert_equal @post.activity_state, "deleted"
  end
end
