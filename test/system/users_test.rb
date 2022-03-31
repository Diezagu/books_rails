# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    visit users_path
  end

  test 'visiting the index' do
    assert_content 'Authors'
  end

  test 'create a user' do
    click_on 'Create'

    fill_in 'Name', with: 'Oscar'
    fill_in 'Age', with: 19
    click_on 'Create User'

    assert_content 'user created!'
  end

  test 'create a user with incorrect values' do
    click_on 'Create'

    fill_in 'Name', with: ''
    fill_in 'Age', with: 19
    click_on 'Create User'

    assert_content 'error while creating user'
  end

  test 'show a user' do
    user = users(:diego)

    click_on 'Show', match: :first

    assert_content user.name
  end

  test 'Edit a user' do
    user = users(:diego)

    click_on 'Edit'

    fill_in 'Name', with: 'Diego'
    fill_in 'Age', with: 12
    click_on 'Edit User'

    assert_content user.name
  end

  test 'Edit a user with incorrect values' do
    click_on 'Edit'

    fill_in 'Name', with: ''
    fill_in 'Age', with: 12
    click_on 'Edit User'

    assert_content 'error while updating a user'
  end

  test 'destroy a user' do
    page.accept_alert 'Are u sure?' do
      click_on 'Destroy'
    end

    assert_content 'user deleted!'
  end

  test 'should download the users report' do
    click_on 'Download Report'

    assert_content 'Authors'
  end
end
