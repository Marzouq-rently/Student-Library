class ReservationsController < ApplicationController
    def update
        @rpa=params[:id]
        @reav=Reservation.find(@rpa)
        check=Book.find(@reav.book_id)
        if check.availablecopy >0 then
            @reav.update({:status=>"Borrowed"})  
            redirect_to "/admin/reservations"
            flash.notice="The book is officially borrowed" 
        else
            redirect_to "/admin/reservations"
            flash.alert="There are no copies available to borrow"
        end
    end
end
