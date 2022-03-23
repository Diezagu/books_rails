require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    visit books_path
  end

  test 'visiting the index' do
    assert_content books(:first_book).title
  end

  test 'creating a user' do
    click_on 'Create'

    fill_in 'Title', with: 'JSG'
    page.select 'Diego', from: 'Author'
    fill_in 'Pages', with: 200
    click_on 'Create Book'

    assert_content 'book created!'
  end

  test 'click on show' do
    click_on 'Show'

    assert_content books(:first_book).title
  end

  test 'click on edit' do
    click_on 'Edit'
    
    fill_in 'Title', with: 'PSG'
    page.select 'Diego', from: 'Author'
    fill_in 'Pages', with: 190
    click_on 'Update Book'
    
    assert_content 'book updated!'
  end
  
  test 'click on destroy' do
    page.accept_alert 'Are u sure?' do
      click_on 'Destroy'
    end

    assert_content 'book deleted!'
  end
end