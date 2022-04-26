# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    sign_in users(:diego)
    visit users_path
  end

  test 'visiting the index' do
    assert_content 'Authors'
  end

  test 'Edit a user with incorrect values' do
    find('.navbar .menu').hover
    click_link 'Edit profile'

    fill_in 'Email', with: 'user@exmple.com'
    fill_in 'Name', with: ''
    fill_in 'Age', with: 12
    fill_in 'user_password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    fill_in 'user_current_password', with: 'example'
    click_on 'Update'

    assert_content "Name can't be blank"
  end

  test 'Edit a user' do
    find('.navbar .menu').hover
    click_link 'Edit profile'
    fill_in 'Email', with: 'user3@exmple.com'
    fill_in 'Name', with: 'Victor'
    fill_in 'Age', with: 12
    fill_in 'user_password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    fill_in 'user_current_password', with: 'example'

    click_on 'Update'

    assert_content 'Your account has been updated successfully.'
  end

  test 'show a user' do
    user = users(:urbi)

    click_on 'Show', match: :first

    assert_content user.name
  end

  test 'should download the users report' do
    click_on 'Download Report'

    assert_content 'Authors'
  end

  test 'should show the books of current user' do
    find('.navbar .menu').hover
    click_link 'My books'

    assert_content users(:diego).books.first.title
  end

  test 'success creating user with correct data' do
    sign_out :user
    visit new_user_registration_path

    fill_in 'Email', with: 'user3@exmple.com'
    fill_in 'Name', with: 'Victor'
    fill_in 'Age', with: 12
    fill_in 'user_password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'

    assert_content 'Welcome! You have signed up successfully.'
  end

  test 'fails if missing name' do
    sign_out :user
    visit new_user_registration_path

    fill_in 'Email', with: 'user3@exmple.com'
    fill_in 'Name', with: ''
    fill_in 'Age', with: 12
    fill_in 'user_password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'

    assert_content "Name can't be blank"
  end
end
