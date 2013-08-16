require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  test "should create user" do
    attrs = attributes_for :user
    post :create, user: attrs

    assert_response :redirect
    user = User.find_by_username(attrs[:username])
    assert user
  end
end
