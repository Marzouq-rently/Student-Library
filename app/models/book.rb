class Book < ApplicationRecord
    has_many :borrows
    has_many :students, through: :borrows
    has_many :reservations
    has_many :students, through: :reservations
end
