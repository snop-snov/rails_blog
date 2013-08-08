require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test "should create user" do
    attrs = attributes_for :user
    assert_difference('User.count') do
      post :create, user: attrs
    end

    assert_redirected_to users_path
  end
end