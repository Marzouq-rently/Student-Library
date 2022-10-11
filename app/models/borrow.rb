class Borrow < ApplicationRecord
    belongs_to :student
    belongs_to :book
    # validates_with BorrowValidator
    validate:borrow_create, on: :create
    validate:borrow_return
    def borrow_create
        if create_check(self.book_id,self.student_id,self.return)==true then
            self.errors.add :base, ("Already borrowed")
        else
            @borrowed=Book.find(self.book_id)
            x=@borrowed.availablecopy
            x=x-1
            @borrowed.update({:availablecopy=>x})
        end
    end
    def create_check(x,y,z)
        b=Borrow.where(book_id:x,student_id:y,return:z)
        b.present?
    end
    def borrow_return
        # debugger
        if self.return== "-" then
            k=self.book_id
            @chanbok=Book.find(k)
            y=@chanbok.availablecopy
            y=y+1
            @chanbok.update({:availablecopy=>y})
        else
            puts("wrong input")
            self.errors.add("Can't return the same book")
        end
    end

    # def create
    #     ch=Borrow.where(book_id:@a, return:"-" )
    #     if ch.present? then
    #         error.add("You have already borrowed the book ")
    #         render "/books/borrowerror"
    #         return
    #     end
    # end
end
