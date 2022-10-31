require 'rails_helper'

RSpec.describe BorrowsController, type: :controller do

    subject{
        create(:student)
    }
    context "if student is authenticated then" do
        it "creates borrow" do
            sign_in :subject
            borrow=create(:borrow)
            expect(build(:borrow)).to eq(borrow)
            expect(get: '/borrows/create').to route_to(controller: 'borrows', action: 'create', id:'create')
        end    
        it "if available copy is not reduced" do
            sign_in :subject
            borrow=create(:borrow)
            book=build(:book)
            book.copy=book.availablecopy
            expect(borrow).to_not be_valid()
        end
        it "updates the borrow" do
            sign_in :subject
            borrow=build(:borrow)
            book=build(:book)
            borrow.returned="Returned"
            book.availablecopy=book.availablecopy+1
            expect(borrow.returned).to eq("Returned")
            expect(get: "/borrows/update").to route_to( :controller => "borrows", :action => "create", :id => "update" )
        end
        it "should create reservation when available copy is 0" do
            sign_in :subject
            book=build(:book)
            book.availablecopy=0
            reservation=create(:reservation)
            expect(build(:reservation)).to eq(reservation)
            expect(get: "borrows/reservation").to route_to(:controller =>"borrows", :action=>"create", :id =>"reservation")
        end
    end

end