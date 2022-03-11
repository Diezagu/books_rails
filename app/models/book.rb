class Book < ApplicationRecord
    validates :title, :author, :pages, presence: true
end
