# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:diego)
  end

  test 'should have index' do
    get comments_path

    assert_response :success
  end

  test 'should have new' do
    get new_comment_path

    assert_response :success
  end

  test 'should create a comment' do
    user = users(:diego)
    post comments_path(params: { comment: { author_id: user.id, text: 'Nice book' } })

    assert_redirected_to comments_path
    assert_equal 'comment posted!', flash[:notice]
  end

  test 'should have edit' do
    get edit_comment_path(comments(:first))

    assert_response :success
  end

  test 'should update a comment' do
    @comment = comments(:first)
    user = users(:diego)

    put comment_path(@comment, params: { comment: { author_id: user.id, text: 'It sucks!' } })

    assert_redirected_to comments_path
    assert_equal 'comment updated!', flash[:notice]
  end

  test 'should show a book' do
    get comment_path(comments(:first))

    assert_response :success
  end

  test 'should destroy a book' do
    delete comment_path(comments(:first))

    assert_redirected_to comments_path
    assert_equal 'comment deleted!', flash[:notice]
  end
end
