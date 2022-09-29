class Book < ApplicationRecord
    has_many :borrows
    has_many :students, through: :borrows
end
