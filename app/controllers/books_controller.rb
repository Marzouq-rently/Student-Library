class BooksController < ApplicationController
  before_action :authenticate_student_or_admin!
    before_action :set_book, only: %i[ show edit destroy update borrowed]
  
    def index
        @book=Book.preload(:borrows, :reservations, :pictures).all
    end
    
    def show
    end

    def edit
    end

    def new
        @book=Book.new
    end

    def create
        @book = Book.new(book_params)
    
        respond_to do |format|
          if @book.save
            format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
            format.json { render :show, status: :created, location: @book }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @book.errors, status: :unprocessable_entity }
          end
        end
    end

    def update
      respond_to do |format|
        if @book.update(book_params)
          format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
          format.json { render :show, status: :ok, location: @book }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @book.destroy
  
      respond_to do |format|
        format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    def borrowhistory
      @bohis=Borrow.all
    end
    def reservationhistory
      @reshis=Reservation.all
    end
    private
      def set_book
        @book = Book.find(params[:id])
      end
  
      def book_params
        params.require(:book).permit( :bookname, :description, :author, :copy, :availablecopy )
      end

end
