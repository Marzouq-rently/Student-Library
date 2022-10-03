class UsersController < ApplicationController
    def Users
    end
    def studenthistory
        sid=current_student.id
        @stbohis=Borrow.find_by(student_id:sid)
        @strehis=Reservation.find_by(student_id:sid)
    end
end
