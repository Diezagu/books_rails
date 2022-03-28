require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    visit books_path
  end

  test 'visiting the index' do
    assert_content books(:first_book).title
  end

  test 'creating a book' do
    click_on 'Create'

    fill_in 'Title', with: 'JSG'
    page.select 'Diego', from: 'Author'
    fill_in 'Pages', with: 200
    click_on 'Create Book'

    assert_content 'book created!'
  end

  test 'should show a book' do
    click_on 'Show'

    assert_content books(:first_book).title
  end

  test 'should update a book' do
    click_on 'Edit'
    
    fill_in 'Title', with: 'PSG'
    page.select 'Diego', from: 'Author'
    fill_in 'Pages', with: 190
    click_on 'Update Book'
    
    assert_content 'book updated!'
  end
  
  test 'should destroy a book' do
    page.accept_alert 'Are u sure?' do
      click_on 'Destroy'
    end

    assert_content 'book deleted!'
  end

  test 'should download the users report' do
    click_on 'Download Report'

    assert_response :success
  end
end