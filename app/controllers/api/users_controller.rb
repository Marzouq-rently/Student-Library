class Api::UsersController < Api::ApplicationController
    def index
        @student=Student.all
        render json:@student, status:200
    end
    def show
        @studentbohis=Borrow.where(student_id:params[:id])
        @studentreshis=Reservation.where(student_id:params[:id])
        @history=["Borrowed history"]+@studentbohis+["Reservation history"]+@studentreshis
        render json: @history, status: 200
    end
end