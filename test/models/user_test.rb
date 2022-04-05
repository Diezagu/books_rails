# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'it is not valid without name' do
    user = User.new(age: 25)

    refute user.valid?
    assert_equal "can't be blank", user.errors.messages[:name].first
  end

  test 'it is not valid without age' do
    user = User.new(name: 'Diego')

    refute user.valid?
    assert_equal "can't be blank", user.errors.messages[:age].first
  end

  test 'age cannot be greater than 100' do
    user = User.new(name: 'Diego', age: 101)

    refute user.valid?
    assert_equal 'must be less than 100', user.errors.messages[:age].first
  end

  test 'age cannot be less than 1' do
    user = User.new(name: 'Diego', age: 0)

    refute user.valid?
    assert_equal 'must be greater than 0', user.errors.messages[:age].first
  end
end
