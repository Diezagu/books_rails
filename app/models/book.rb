# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_one_attached :cover
  has_many :comments, foreign_key: 'id'

  validates :title, :author, :pages, presence: true
  validates :cover, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
