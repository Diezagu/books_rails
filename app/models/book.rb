class Book < ApplicationRecord
    belongs_to :author, class_name: 'User'
    validates :title, :author, :pages, presence: true
end
