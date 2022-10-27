class Reservation < ApplicationRecord
    belongs_to :student
    belongs_to :book
    validate:reservation_create, on: :create
    validate:reservation_update, on: :update
    after_update :checking_copy
    def reservation_create
        if create_check(self.book_id,self.student_id,self.status)==true then
            self.errors.add :base, ("Already borrowed")
        else
        end
    end
    
    def reservation_update
        if self.changes== {"status"=>["Reserved","Borrowed"]} then
        else
            self.errors.add("Already borrowed")
        end
    end

    def create_check(x,y,z)
        b=Reservation.where(book_id:x,student_id:y,status:z)
        b.present?
    end
    def checking_copy
        check=Book.find(self.book_id)
        if check.availablecopy >0 then
            # self.update({:status=>"Borrowed"})
            @bo=Borrow.new
            @bo.student_id=self.student_id
            @bo.book_id=self.book_id
            @bo.return="-"
            @bo.save   
            # redirect_to "/admin/reservations"
            # flash.notice="The book is officially borrowed" 
        else
            # redirect_to "/admin/reservations"
            # flash.alert="There are no copies available to borrow"
            self.errors.add("There are no copies available to borrow")
        end
    end

end
