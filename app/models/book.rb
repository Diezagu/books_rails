# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :title, :author, :pages, presence: true
end
