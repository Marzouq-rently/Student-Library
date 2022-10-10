class Borrow < ApplicationRecord
    belongs_to :student
    belongs_to :book
    validate :create
    def create
        ch=Borrow.where(book_id:@a, return:"-" )
        if ch.present? then
            error.add("You have already borrowed the book ")
            render "/books/borrowerror"
            return
        end
    end
end
