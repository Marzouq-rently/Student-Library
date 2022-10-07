class UsersController < ApplicationController
    def Users
    end
    def studenthistory
        @sid=current_student.id
        @stbohis=Borrow.all
        @strehis=Reservation.all
    end
    def return
        @pa=params[:format].to_i
        @boret=Borrow.find(@pa)
        #@boret.return="Returned"
        @boret.update({:return=>"Returned"})
        @boret.save
    end
    def status
        @rpa=params[:format].to_i
        @reav=Reservation.find(@pa)
        #@boret.return="Returned"
        @reav.update({:return=>"Borrowed"})
        @reav.save
    end
end
