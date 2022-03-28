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

	test 'create a user with incorrect values' do
		visit users_path
		click_on 'Create'

		fill_in 'Name', with: ''
		fill_in 'Age', with: 19
		click_on 'Create User'

		assert_content 'error while creating user'
	end

	test 'show a user' do
		visit users_path
		user = users(:diego)

		click_on 'Show', match: :first

		assert_content user.name
	end

	test 'Edit a user' do
		visit users_path
		user = users(:diego)
		
		click_on 'Edit'

		fill_in 'Name', with: 'Diego'
		fill_in 'Age', with: 12
		click_on 'Edit User'

		assert_content user.name
	end

	test 'Edit a user with incorrect values' do
		visit users_path
		user = users(:diego)
		
		click_on 'Edit'

		fill_in 'Name', with: ''
		fill_in 'Age', with: 12
		click_on 'Edit User'

		assert_content 'error while updating a user'
	end

	test 'destroy a user' do
		visit users_path

		page.accept_alert 'Are u sure?' do
				click_on 'Destroy'
		end

		assert_content 'user deleted!'
	end
end