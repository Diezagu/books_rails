class User < ApplicationRecord
    has_many :books, foreign_key: 'author_id'
    validates :name, :age, presence: true
    validates :age, numericality: { greater_than: 0, less_than: 100 }
end
