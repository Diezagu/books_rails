# frozen_string_literal: true

require 'test_helper'

module Users
  class CommentsControllerTest < ActionDispatch::IntegrationTest
    setup do
      sign_in users(:diego)
    end

    test 'should create a comment for user' do
      user_commenter = users(:diego)
      user_commented = users(:urbi)

      post user_comments_path(user_commented, { comment: { author_id: user_commenter.id, text: 'Nice author!' } })

      assert_equal 'comment posted!', flash[:notice]
      assert_redirected_to user_path(user_commented)
    end

    test 'should destroy a comment of a user' do
      user = users(:urbi)
      comment = user.comments.create(author: users(:diego), text: 'nice auhtor')

      delete user_comment_path(user, comment)

      assert_redirected_to user_path(user)
      assert_equal 'comment deleted!', flash[:notice]
    end

    test 'should not destroy a comment if author is different to current user' do
      user = users(:diego)
      comment = user.comments.create(author: users(:urbi), text: 'nice author')

      assert_raises ActiveRecord::RecordNotFound do
        delete user_comment_path(user, comment)
      end
    end
  end
end
