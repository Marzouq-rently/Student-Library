class BorrowValidator < ActiveModel::Validator
    # @a=params[:id]
    # bok=Book.find(@a)
    # @s=current_student.id
    # @x=bok.availablecopy
    # bid=Borrow.find_by(book_id:@a)
    def validate(a)
        if create_check(a.book_id,a.student_id,a.return)==true then
            a.errors.add :base, ("Already borrowed")
        else
            @borrowed=Book.find(a.book_id)
            x=@borrowed.availablecopy
            x=x-1
            @borrowed.update({:availablecopy=>x})
        end
        # if a.return== "-" then
        #     a.update({:return=>"Returned"})
        #     k=a.book_id
        #     @chanbok=Book.find(k)
        #     y=@chanbok.availablecopy
        #     y=y+1
        #     @chanbok.update({:availablecopy=>y})
        # else

        #     a.errors.add("Can't return the same book")
        # end
    end
    
    def create_check(x,y,z)
        b=Borrow.where(book_id:x,student_id:y,return:z)
        b.present?
    end

end