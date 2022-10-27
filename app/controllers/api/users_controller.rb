class Api::UsersController < Api::ApplicationController
    # def index
    #     @bos=Borrow.all
    #     render json: @bos, status: 200
    # end
    def show
        @studentbohis=Borrow.where(student_id:params[:id])
        @studentreshis=Reservation.where(student_id:params[:id])
        @history=@studentbohis+@studentreshis
        # respond_to do |format|
        #     format.html
        #     format.json { render json: {all_data: {data: @studentbohis, data1: @studentreshis}}}
        # end
        render json: @history, status: 200
    end
end