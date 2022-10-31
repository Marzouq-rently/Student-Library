class Api::BooksController < Api::ApplicationController
    def index
        @books=Book.all
        render json: @books, status: 200
    end
    def show
        @books=Book.find(params[:id])
        render json: @books, status: 200
    end
    def create
        @books= Book.new(bookparams)
        if @books.save
            render json: @books, status: 200
        end
    end

    def update
        @books=Book.find(params[:id])
        if @books.update(bookparams)
            render json: @books, status: 200
        else
            render json:{"error": "not updated"}
        end
    end

    def destroy
        begin
            @books = Book.find(params[:id])
            if @books.destroy
                render json: @books, status: 200
            else
                render json:{error:"Wrong Bookid", status: false}, status:400
            end
        rescue => exception
            render json:{error:exception, status:false}, status: 500
        end

    end

    def bookparams
        params.require(:book).permit(:bookname, :description, :author, :copy, :availablecopy)
    end


end