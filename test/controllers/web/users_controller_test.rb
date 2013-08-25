require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  test "should create user" do
    attrs = attributes_for :user
    post :create, user: attrs

    assert_response :redirect
    user = User.where(username: attrs[:username]).first
    assert { user }
  end
end
