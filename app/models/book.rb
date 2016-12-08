class Book < ApplicationRecord
  has_many :book_menus,dependent: :destroy
end
