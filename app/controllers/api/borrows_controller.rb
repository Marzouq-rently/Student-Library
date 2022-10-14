class Api::BorrowsController < Api::ApplicationController
    def index
        @borrows=Borrow.all
        render json: @borrows, status: 200
    end
end