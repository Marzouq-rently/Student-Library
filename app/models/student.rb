class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :borrows
  has_many :books, through: :borrows
  has_many :reservations
  has_many :books, through: :reservations
  has_many :pictures, as: :pictureable

  validates :email, format: URI::MailTo::EMAIL_REGEXP
  
  # the authenticate method from devise documentation
  def self.authenticate(email, password)
    byebug
    student = Student.find_for_authentication(email: email)
    student&.valid_password?(password) ? student : nil
  end
end
