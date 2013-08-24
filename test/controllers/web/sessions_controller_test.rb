require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test "should create session" do
    attrs = {:username => @user.username, :password => @user.password}
    post :create, user_sign_in_type: attrs
    assert_redirected_to posts_path
    assert { signed_in? }
  end

  test "should destroy session" do
    sign_in @user
    delete :destroy
    assert_redirected_to posts_path
    assert { !signed_in? }
  end
end
