# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:diego)
  end

  test 'should have index' do
    get users_path

    assert_response :success
  end

  test 'should create a user' do
    post users_path, params: { user: { name: 'Diego', age: 22 } }

    assert_redirected_to users_path
    assert_equal 'user created!', flash[:notice]
  end

  test 'should not create a user with incorrect values' do
    post users_path, params: { user: { name: '', age: 22 } }

    assert_response :success
    assert_equal 'error while creating user', flash[:alert]
  end

  test 'should have new' do
    get new_user_path

    assert_response :success
  end

  test 'should have edit' do
    get edit_user_path(@user)

    assert_response :success
  end

  test 'should show a user' do
    get user_path(@user)

    assert_response :success
  end

  test 'should update a user' do
    put user_path(@user), params: { user: { name: 'Carlos', age: 19 } }

    assert_redirected_to users_path
    assert_equal 'user updated!', flash[:notice]
  end

  test 'should not update a user with incorrect values' do
    put user_path(@user), params: { user: { name: '', age: 19 } }

    assert_response :success
    assert_equal 'error while updating a user', flash[:alert]
  end

  test 'should destroy a user' do
    delete user_path(@user)

    assert_redirected_to users_path
    assert_equal 'user deleted!', flash[:notice]
  end
end
