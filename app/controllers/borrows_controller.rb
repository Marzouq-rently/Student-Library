class BorrowsController < ApplicationController
    def create
      @a=params[:id]
      bok=Book.find(@a)
      @s=current_student.id
      @x=bok.availablecopy
      bid=Borrow.find_by(book_id:@a)
      if @x>0
        # if Borrow.where(book_id:@a,student_id:@s,return:"-").present?
        #   flash.alert="You have borrowed"
        #   render "borrowerror"
        #   return
        # else
          @bo=Borrow.new
          @bo.student_id=current_student.id
          @bo.book_id=@a
          @bo.return="-"
          @borrowed=Book.find(@a)
          @bo.save
          flash.alert="You have borrowed this book"

        # end
      else
          bid=Borrow.where(book_id:@a,student_id:current_student.id,return:"-")
          if bid.present?
            render "/books/borrowerror"
            return
          else
            reservation(@a)
          end
      end
    end

    def reservation(a)
      rid=Reservation.find_by(book_id:a)
      if rid == nil  then
        @res=Reservation.new
        @res.student_id=current_student.id
        @res.book_id=a
        @res.status="Reserved"
        @res.save
        @borrowed=Book.find(a)
        render "reservation"
        return
      else
        rid=Reservation.where(book_id:a,student_id:@s,status:"Reserved")
        if rid.present? then
          render "reserverror1"
          return
        else
          @res=Reservation.new
          @res.student_id=current_student.id
          @res.book_id=a
          @res.status="Reserved"
          @res.save
          @borrowed=Book.find(a)
          render "reservation" 
        #  render "reserverror2"
         return
        end
      end
    end

    def return
      @pa=params[:id]
      @boret=Borrow.find(@pa)
      # @boret.return="Returned"
        @boret.update({:return=>"Returned"})
      @boret.return="Ret"
      # if @boret.return=="-" then
      #     @boret.update({:return=>"Returned"})
      #     @boret.save      
      #     k=@boret.book_id
      #     @chanbok=Book.find(k)
      #     y=@chanbok.availablecopy
      #     y=y+1
      #     @chanbok.update({:availablecopy=>y})
      # end
    end

end
