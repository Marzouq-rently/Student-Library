class UsersController < ApplicationController
    def Users
    end
    def studenthistory
        @sid=current_student.id
        @stbohis=Borrow.all
        @strehis=Reservation.all
    end
    # def return 
    #     @pa=params[:format].to_i
    #     @boret=Borrow.find(@pa)
    #     if @boret.return=="-" then
    #         @boret.update({:return=>"Returned"})
    #         @boret.save
            
    #         k=@boret.book_id
    #         @chanbok=Book.find(k)
    #         y=@chanbok.availablecopy
    #         y=y+1
    #         @chanbok.update({:availablecopy=>y})
    #     end
    # end
    def status
        @rpa=params[:format].to_i
        @reav=Reservation.find(@rpa)
        if @reav.status=="Reserved" then
            check=Book.find(@reav.book_id)
            if check.availablecopy >0 then
            #@boret.return="Returned"
                @reav.update({:status=>"Borrowed"})
                @reav.save

                @bo=Borrow.new
                @bo.student_id=@reav.student_id
                @bo.book_id=@reav.book_id
                @bo.return="-"
                @bo.save
                @borrowed=Book.find(@reav.book_id)
                x=@borrowed.availablecopy
                x=x-1
                @borrowed.update({:availablecopy=>x})
            else
                flash.alert="There are no copies available to borrow"
            end
        else
            flash.alert="The user has already borrowed the book"
        end

    end
end
