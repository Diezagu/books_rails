# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, foreign_key: 'author_id'
  has_many :comments, as: :commentable
  has_one_attached :avatar

  validates :name, :age, presence: true, allow_blank: false
  validates :age, numericality: { greater_than: 0, less_than: 100 }
  validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
