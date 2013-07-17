require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should create post" do
    authenticate

    assert_difference('Post.count') do
      post :create, post: {title: 'Some title'}
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should get show" do
    get :show, id: posts(:one).id
    assert_response :success
  end

  test "should get edit" do
    authenticate
    get :edit, id: posts(:two).id
    assert_response :success
  end

  test "should destroy post" do
    authenticate

    assert_difference('Post.count', -1) do
      post :destroy, id: posts(:two).id
    end

    assert_redirected_to :posts
  end

end
