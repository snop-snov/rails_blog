require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test "should create user" do
    attrs = attributes_for :user
    post :create, user: attrs

    assert_response :redirect
    user = User.find_by_username(attrs[:username])
    assert user
  end
end