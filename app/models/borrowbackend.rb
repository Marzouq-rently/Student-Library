class Borrowbackend < ApplicationRecord
    belongs_to :student
    belongs_to :book
end
