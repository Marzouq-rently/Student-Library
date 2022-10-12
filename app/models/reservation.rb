class Reservation < ApplicationRecord
    belongs_to :student
    belongs_to :book
    validate:reservation_create, on: :create
    validate:reservation_update, on: :update
    
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

end
