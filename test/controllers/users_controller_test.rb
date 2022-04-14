# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:diego)
    sign_in @user
  end

  test 'should have index' do
    get users_path

    assert_response :success
  end

  test 'should show a user' do
    get user_path(@user)

    assert_response :success
  end

  test 'should destroy a user' do
    delete user_path(@user)

    assert_redirected_to users_path
    assert_equal 'user deleted!', flash[:notice]
  end
end
