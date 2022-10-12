class UsersController < ApplicationController
    def Users
    end
    def studenthistory
        @sid=current_student.id
        @stbohis=Borrow.all
        @strehis=Reservation.all
    end
end
