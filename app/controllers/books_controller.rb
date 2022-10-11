class BooksController < ApplicationController
  before_action :authenticate_student_or_admin!
    before_action :set_book, only: %i[ show edit destroy update borrowed]
  
    def index
        @book=Book.all
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

    # def borrowed
    #   @a=params[:id]
    #   bok=Book.find(@a)
    #   @s=current_student.id
    #   @x=bok.availablecopy
    #   bid=Borrow.find_by(book_id:@a)
    #   if @x>0
    #     if Borrow.where(book_id:@a,student_id:@s,return:"-").present?
    #       flash.alert="You have borrowed"
    #       render "borrowerror"
    #       return
    #     else
    #       @bo=Borrow.new
    #       @bo.student_id=current_student.id
    #       @bo.book_id=@a
    #       @bo.return="-"
    #       @borrowed=Book.find(@a)
    #       x=@borrowed.availablecopy
    #       x=x-1
    #       @borrowed.update({:availablecopy=>x})
    #       @bo.save
    #       return
    #     end
    #   else
    #       bid=Borrow.where(book_id:@a,student_id:current_student.id,return:"-")
    #       if bid.present?
    #         render "borrowerror"
    #         return
    #       else
    #         reservation(@a)
    #       end
    #   end

    #   elsif bid.student_id==current_student.id && bid.return=="-"then
      #       render "borrowerror"
      #       return
      #   else
      #       @bo=Borrow.new
      #       @bo.student_id=current_student.id
      #       @bo.book_id=@a
      #       @bo.return="-"
      #       @bo.save
      #       @borrowed=Book.find(@a)
      #       x=@borrowed.availablecopy
      #       x=x-1
      #       @borrowed.update({:availablecopy=>x})
      #       return
      #   end
      #   # bid.return=="Returned" then
      # else
      #   bid=Borrow.find_by(book_id:@a,student_id:current_student.id)
      #   if bid.return=="-"then
      #     render "borrowerror"
      #     return
      #   else
      #     reservation(@a)
      #   end
      # end
    #end

    # def reservation(a)
    #   rid=Reservation.find_by(book_id:a)
    #   if rid == nil  then
    #     @res=Reservation.new
    #     @res.student_id=current_student.id
    #     @res.book_id=a
    #     @res.status="Reserved"
    #     @res.save
    #     @borrowed=Book.find(a)
    #     render "reservation"
    #     return
    #   else
    #     rid=Reservation.where(book_id:a,student_id:@s,status:"Reserved")
    #     if rid.present? then
    #       render "reserverror1"
    #       return
    #     else
    #       @res=Reservation.new
    #       @res.student_id=current_student.id
    #       @res.book_id=a
    #       @res.status="Reserved"
    #       @res.save
    #       @borrowed=Book.find(a)
    #       render "reservation" 
    #     #  render "reserverror2"
    #      return
    #     end
    #   end
    # end
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
        params.require(:book).permit( :bookname, :description, :author, :copy )
      end

end
