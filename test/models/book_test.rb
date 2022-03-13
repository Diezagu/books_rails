require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'it is not valid without title' do
    book = Book.new

    refute book.valid?
    assert_equal "can't be blank", book.errors.messages[:title].first
  end

  test 'it is not valid without author' do
    book = Book.new

    refute book.valid?
    assert_equal "must exist", book.errors.messages[:author].first
  end

  test 'it is not valid without pages' do
    book = Book.new

    refute book.valid?
    assert_equal "can't be blank", book.errors.messages[:pages].first
  end

  test 'it is valid with title, author and pages' do
    us = User.new(name: 'Diego', age: 22)
    book = Book.new(title: 'Well Grounded', author: us, pages: 200)

    assert book.valid?
  end
end
