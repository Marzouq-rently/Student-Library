class Book < ApplicationRecord
    validates_presence_of :bookname, :author, :description, :copy, :availablecopy
    has_many :borrows
    has_many :students, through: :borrows
    has_many :reservations
    has_many :students, through: :reservations
    has_many :pictures, as: :pictureable

end
