require 'rails_helper'

RSpec.describe BorrowsController, type: :controller do

    subject{
        create(:student)
    }
    context "if student is authenticated then" do
        it "creates borrow" do
            sign_in :subject
            # borrow=create(:borrow)
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
            expect(get: "/borrows/update").to route_to( :controller => "borrows", :action => "create", :id => "update" )
        end
            
        # it 'if there are no copies they cannot borrow but reserve' do
        #     sign_in :subject
        #     book=build(:book)
        #     book.availablecopy=0
        #     if book.availablecopy==0 then
        #         reservation=create(:reservation)
        #     end
        #     expect(reservation).to be_valid()
        # end
    end

end