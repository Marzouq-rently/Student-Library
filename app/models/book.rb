class Book < ApplicationRecord
    validates_presence_of :bookname, :author, :description
    has_many :borrows
    has_many :students, through: :borrows
    has_many :borrowbackends
    has_many :students, through: :reservationbackends
    has_many :reservationbackends
    has_many :students, through: :reservationbackends
    has_many :reservations
    has_many :students, through: :reservations
    has_many :pictures, as: :pictureable
end
