class Api::BorrowsController < ApplicationController
    def index
        @borrows=Borrow.all
        render json: @borrows, status: 200
    end
end