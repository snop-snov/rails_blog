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

    assert_redirected_to posts_path
  end

  test "should not create post with short title" do
    authenticate
    assert_no_difference('Post.count') do
      post :create, post: {title: ''}
    end
    assert_response :success
  end

  test "should get show" do
    get :show, id: posts(:one).id
    posts(:one).reload
    assert_equal posts(:one).state, "viewed"
    assert_response :success
  end

  test "should get edit" do
    authenticate
    get :edit, id: posts(:two).id
    assert_response :success
  end

  test "should update post" do
    authenticate
    put :update, id: posts(:two).id, post: {title: 'Some title'}
    posts(:two).reload
    assert_equal posts(:two).state, "new"

    assert_redirected_to :posts
  end

  test "should not update post without title" do
    authenticate
    put :update, id: posts(:two).id, post: {title: ''}
    posts(:two).reload
    assert_equal posts(:two).title, "MyString"

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