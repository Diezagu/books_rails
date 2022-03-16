require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:first_book)
  end
  test 'should have index' do
    get books_path

    assert_response :success
  end

  test 'should have new' do
    get new_book_path

    assert_response :success
  end

  test 'should create a book' do
    user = User.new(name: 'Diego', age: 22)
    user.save

    post books_path( params: { book: { title: 'TWGR', author_id: user.id, pages: 250 } })

    assert_redirected_to books_path
  end

  test 'should have edit' do
    get edit_book_path(@book)

    assert_response :success
  end

  test 'should update a book' do
    user = User.new(name: 'Diego', age: 22)
    user.save

    put book_path(@book, params: { book: { title: 'Rome', author_id: user.id, pages: 200 } })

    assert_redirected_to books_path
  end

  test 'should show a book' do
    get book_path(@book)
    
    assert_response :success
  end 
  
  test 'should destroy a book' do
    delete book_path(@book)

    assert_redirected_to books_path
  end
end