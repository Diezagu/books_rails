# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:diego)
  end

  test 'should create a comment' do
    user = users(:diego)
    book = books(:first_book)

    post book_comments_path(book, params: { comment: { author_id: user.id, text: 'Nice book' } })

    assert_redirected_to book_path(book)
    assert_equal 'comment posted!', flash[:notice]
  end

  test 'should destroy a comment of a book' do
    book = books(:first_book)
    comment = book.comments.create(author: users(:diego), text: 'nice book')

    delete book_comment_path(book, comment)

    assert_redirected_to book_path(book)
    assert_equal 'comment deleted!', flash[:notice]
  end

  test 'should not destroy a comment if author is different to current user' do
    book = books(:first_book)
    comment = book.comments.create(author: users(:urbi), text: 'nice book')

    assert_raises ActiveRecord::RecordNotFound do
      delete book_comment_path(book, comment)
    end
  end
end
