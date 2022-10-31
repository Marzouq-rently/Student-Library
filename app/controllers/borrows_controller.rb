class BorrowsController < ApplicationController
    def create
      @a=params[:id]
      bok=Book.find(@a)
      @s=current_student.id
      @x=bok.availablecopy
      @c=bok.copy
      bid=Borrow.find_by(book_id:@a)
      cav=Reservation.where(book_id:@a,status:"Reserved").count
      if cav!=nil && cav>=@c
        flash.alert="The book is reserved. Please Wait for some time"
        redirect_to "/books"
      else
        if @x>0
            @bo=Borrow.new
            @bo.student_id=current_student.id
            @bo.book_id=@a
            @bo.returned="-"
            @borrowed=Book.find(@a)
            @bo.save
            redirect_to "/books"
            flash.alert="You have borrowed this book"
            return
        else
            bid=Borrow.where(book_id:@a,student_id:current_student.id,returned:"-")
            if bid.present?
              render "/books/borrowerror"
              return
            else
              reservation(@a,@c)
            end
        end
      end
    end

    def reservation(a,x)
      cav=Reservation.where(book_id:a,status:"Reserved").count
      if  cav<x then
        @res=Reservation.new
        @res.student_id=current_student.id
        @res.book_id=a
        @res.status="Reserved"
        @res.save
        @borrowed=Book.find(a)
        redirect_to "/books"
        flash.alert="You have reserved this book"
        return
      else
        rid=Reservation.where(book_id:a,student_id:@s,status:"Reserved")
        if rid.present? then
          redirect_to "/books"
          flash.alert="You have already reserved this book"
          return
        else
          redirect_to "/books"
          flash.alert="Reservation is over. Sorry for the inconvinience"
          return
        end
      end
    end

    def update
      @pa=params[:id]
      @boret=Borrow.find(@pa)
      @boret.update({:returned=>"Returned"})
    end

end