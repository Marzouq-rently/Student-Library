class BorrowsController < ApplicationController
    def create
      @a=params[:id]
      bok=Book.find(@a)
      @s=current_student.id
      @x=bok.availablecopy
      bid=Borrow.find_by(book_id:@a)
      if @x>0
          @bo=Borrow.new
          @bo.student_id=current_student.id
          @bo.book_id=@a
          @bo.return="-"
          @borrowed=Book.find(@a)
          x=@borrowed.availablecopy
          x=x-1
          @borrowed.update({:availablecopy=>x})
          @bo.save
          render "/books/borrowed"
          return
      end

    end
end
