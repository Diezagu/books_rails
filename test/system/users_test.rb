require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase

    test 'visiting the index' do
        visit users_path

        assert_content 'Authors'
    end

    test 'create a user' do
        visit users_path
        click_on 'Create'

        fill_in 'Name', with: 'Oscar'
        fill_in 'Age', with: 19

        click_on 'Create User'
        assert_content 'user created!'
    end

    test 'show a user' do
        visit users_path
        user = users(:diego)
        click_on 'Show', match: :first

        assert_content user.name
    end

    test 'destroy a us' do
        visit users_path()

        page.accept_alert 'Are u sure?' do
            click_on 'Destroy'
        end

        assert_content 'user deleted!'
    end
end