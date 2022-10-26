class Borrow < ApplicationRecord
    belongs_to :student
    belongs_to :book
    # validates_presence_of :student_id, :book_id, :created_at, :updated_at
    # validates_with BorrowValidator
    validate:borrow_create, on: :create
    validate:borrow_return, on: :update
    
    def borrow_create
        if create_check(self.book_id,self.student_id,self.return)==true then
            self.errors.add :base, ("Already borrowed")
        else
            #debugger
            #@borrowed=Book.find(self.book_id)
             @borrowed=Book.find_by_id(self.book_id)
             @bor=Book.find_by_id(self.student_id)
            if @borrowed==nil && @bor==nil
                self.errors.add :base, ("No Book id or Student Id") unless @borrowed
            else
                x=@borrowed.availablecopy
                x=x-1
                @borrowed.update({:availablecopy=>x})
            end
        end
    end
    
    def borrow_return
        if self.changes== {"return"=>["-","Returned"]} then
            k=self.book_id
            @chanbok=Book.find(k)
            y=@chanbok.availablecopy
            y=y+1
            @chanbok.update({:availablecopy=>y})
        else
            self.errors.add("Can't return the same book")
        end
    end

    def create_check(x,y,z)
        b=Borrow.where(book_id:x,student_id:y,return:z)
        b.present?
    end
end
