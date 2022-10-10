class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :borrows
  has_many :books, through: :borrows
  # has_many :borrowbackends
  # has_many :books, through: :borrowbackends
  # has_many :reservationbackends
  # has_many :books, through: :reservationbackends
  has_many :reservations
  has_many :books, through: :reservations
  has_many :pictures, as: :pictureable
end
